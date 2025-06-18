<#
.SYNOPSIS
    Insepct a .back file from SQL Server and generate a RESTORE script with custom routes
.AUTHOR
    JhonL2002
#>

param (
    [string]$backupPath = "C:\YourPath\Backups\MiniDropBoxDB.bak", # <-- Replace with your .bak file path
    [string]$restoreToPath = "C:\YourPath\RestoreTarget", # <-- Replace with your data folder
    [string]$serverInstance = "Instance\Instance",
    [string]$newDatabaseName = "MiniDropBoxDb"
)

# Initial validation
if (-not (Test-Path $backupPath)) {
    Write-Error "Backup file not found: $backupPath"
    exit
}

# Execute RESTORE HEADERONLY
$headerQuery = "RESTORE HEADERONLY FROM DISK = N'$backupPath';"
$header = Invoke-Sqlcmd -Query $headerQuery -ServerInstance $serverInstance

if (-not $header) {
    Write-Error "Failed to read backup header."
    exit
}

# Funcion to convert backup type into description
function Get-BackupTypeDescription($backupType) {
    switch ($backupType) {
        1 { return "FULL" }
        2 { return "DIFF" }
        3 { return "LOGS" }
        default { return "UNKNOWN" }
    }
}

# Show backup information
$header | Select-Object @{Name = "BackupType"; Expression = { Get-BackupTypeDescription $_.BackupType } }, RecoveryModel, BackupStartDate, DatabaseName | Format-Table -AutoSize

# Verify if database already exists
$dbCheckQuery = "SELECT name FROM sys.databases WHERE name = N'$newDatabaseName';"
$dbExists = Invoke-Sqlcmd -Query $dbCheckQuery -ServerInstance $serverInstance

$replace = $false
if ($dbExists) {
    Write-Warning "Database '$newDatabaseName' already exists on $serverInstance"
    $response = Read-Host "Do you want to overwrite this? (S/N)"
    if ($response -eq "S" -or $response -eq "s") {
        $replace = $true
    }
    else {
        Write-Host "Operation was cancelled by user"
        exit
    }
}

# Get logical file names from backup
$filesQuery = "RESTORE FILELISTONLY FROM DISK = N'$backupPath';"
$files = Invoke-Sqlcmd -Query $filesQuery -ServerInstance $serverInstance

if (-not $files) {
    Write-Error "Could not retrieve logical file list"
}

# Build RESTORE DATABASE script
Write-Host "Generated RESTORE DATABASE script:" -ForegroundColor Cyan
Write-Host "----------------------------------"

$restoreScript = @"
RESTORE DATABASE [$newDatabaseName] FROM DISK = N'$backupPath' WITH
MOVE N'$($files[0].LogicalName)' TO N'$restoreToPath\$newDatabaseName.mdf',
MOVE N'$($files[1].LogicalName)' TO N'$restoreToPath\$newDatabaseName.ldf',
RECOVERY$(if ($replace) { ", REPLACE" });
"@

Write-Host "`n$restoreScript" -ForegroundColor Yellow

# Save generated script into .sql file
Out-File -FilePath "$restoreToPath\Restore_$newDatabaseName.sql" -InputObject $restoreScript -Encoding utf8
