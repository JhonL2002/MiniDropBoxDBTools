# ====================================
# Script to create an Azure SQL Database with managed identity
# Author: JhonL2002
# Includes: Azure SQL Database S0
# File: CreateKeyVaultScript
# ====================================

# VARIABLES
$resourceGroupName = "MiniDropBox0000" # Use the real name created on "CreateKeyVaultScript.ps1"
$location = "West US 2"
$serverName = "minidropboxsql$(Get-Random -Maximum 9999)"
$adminUser = "dp300admin"
$vaultName = "kv-minidropbox0000" # Use Use the real name created on "CreateKeyVaultScript.ps1"
$vaultSecretName = "SQLAdminPassword" # (Optional) Change this name
$databaseName = "MiniDropBoxDb" # (Optional) Change this name

# Get password from Azure Key Vault
$secret = Get-AzKeyVaultSecret -VaultName $vaultName -Name $vaultSecretName
$adminPassword = $secret.SecretValue

# Create SQL Server with identity
New-AzSqlServer `
    -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -Location $location `
    -SqlAdministratorCredentials (New-Object PSCredential($adminUser, $adminPassword)) `
    -AssignIdentity `
    -ErrorAction Stop

Write-Host "SQL Server '$serverName' created with managed identity" -ForegroundColor Green

# Create S0 database
New-AzSqlDatabase `
    -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -DatabaseName $databaseName `
    # Change the edition
    -Edition Standard `
    # Change this service
    -RequestedServiceObjectiveName S0 `
    -ErrorAction Stop

Write-Host "Database '$databaseName' created on server $serverName (S0). " -ForegroundColor Green
