# SQL Server Backup Scripts (PowerShell)

#===============================
# Backup-Diff.ps1
# Description: DIFF backup (each 12 hours)
#===============================

$timestamp = Get-Date -Format yyyyMMdd_HHmm
$backupPath = "C:\DP-300\SQLData\Backups\MiniDropBox\Diff\MiniDropBoxDb_DIFF_$timestamp.bak" # <- You can change this
$backupSetName = "MiniDropBox_DIFF_$timestamp"
$backupDescription = "Automated differential copy performed at $timestamp"
$backupQuery = @"
BACKUP DATABASE [MiniDropBoxDb]
TO DISK = N'$backupPath'
WITH
    NAME = N'$backupSetName',
    DESCRIPTION = N'$backupDescription',
    DIFFERENTIAL,
    COMPRESSION,
    CHECKSUM,
    INIT;
"@

Invoke-Sqlcmd -Query $backupQuery -ServerInstance "MYINSTANCE\MYINSTANCE"