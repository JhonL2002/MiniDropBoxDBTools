# SQL Server Backup Scripts (PowerShell)

#===============================
# Backup-Log.ps1
# Description: LOG backup (each 10 minutes)
#===============================

$timestamp = Get-Date -Format yyyyMMdd_HHmm
$backupPath = "C:\DP-300\SQLData\Backups\MiniDropBox\Log\MiniDropBoxDb_LOG_$timestamp.trn" # <- You can change this
$backupSetName = "MiniDropBox_LOG_$timestamp"
$backupDescription = "Automated log copy performed at $timestamp"
$backupQuery = @"
BACKUP LOG [MiniDropBoxDb]
TO DISK = N'$backupPath'
WITH
    NAME = N'$backupSetName',
    DESCRIPTION = N'$backupDescription',
    COMPRESSION,
    CHECKSUM,
    INIT;
"@

Invoke-Sqlcmd -Query $backupQuery -ServerInstance "MYINSTANCE\MYINSTANCE"