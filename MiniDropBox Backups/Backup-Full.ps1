# SQL Server Backup Scripts (PowerShell)

#===============================
# Backup-Full.ps1
# Description: FULL backup (weekly)
#===============================

$timestamp = Get-Date -Format yyyyMMdd_HHmm
$backupPath = "C:\DP-300\SQLData\Backups\MiniDropBox\Full\MiniDropBoxDb_FULL_$timestamp.bak" # <- You can change this
$backupSetName = "MiniDropBox_FULL_$timestamp"
$backupDescription = "Automated full copy performed at $timestamp"
$backupQuery = @"
BACKUP DATABASE [MiniDropBoxDb]
TO DISK = N'$backupPath'
WITH
    NAME = N'$backupSetName',
    DESCRIPTION = N'$backupDescription',
    COMPRESSION,
    CHECKSUM,
    INIT;
"@

Invoke-Sqlcmd -Query $backupQuery -ServerInstance "MYINSTANCE\MYINSTANCE"