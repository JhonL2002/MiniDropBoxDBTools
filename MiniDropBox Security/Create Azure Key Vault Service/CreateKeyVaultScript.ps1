# ====================================
# Script to create an Azure Key Vault
# Author: JhonL2002
# Includes: Azure Key Vault instance
# File: CreateKeyVaultScript
# ====================================

# VARIABLES
$resourceGroupName = "MiniDropBox$(Get-Random -Maximum 9999)"
$location = "West US 2"
$vaultName = "kv-minidropbox$(Get-Random -Maximum 9999)"
$cmkName = "MiniDropBoxCMK"

# Get current user (who execute script?)
$userPrincipal = "your_user_principal_name" # Put your user principal name

# Create resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location
Write-Host "Resource group $resourceGroupName created successfully!"

# Create Key Vault instance with Purge Protection
# Important!!
# Force Access Policy instead RBAC to perform perfect script execution
# RBAC needs wait some minutes to refresh changes
# Enable -DisableRbacAuthorization param
New-AzKeyVault `
    -Name $vaultName `
    -ResourceGroupName $resourceGroupName `
    -DisableRbacAuthorization `
    -Location $location `
    -Sku Premium `
    -EnablePurgeProtection `
    -ErrorAction Stop

Write-Host "Key vault '$vaultName' created successfully!" -ForegroundColor Green

# Assign Access Policy to current user
Set-AzKeyVaultAccessPolicy `
    -VaultName $vaultName `
    -UserPrincipalName $userPrincipal `
    -PermissionsToKeys create, get, list, update, delete, import, backup, restore, recover, purge `
    -PermissionsToSecrets all `
    -ErrorAction Stop

Write-Host "Access policy assigned to $userPrincipal ." -ForegroundColor Green

# Create key for TDE (BYOK)
Add-AzKeyVaultKey `
    -VaultName $vaultName `
    -Name $cmkName `
    -Destination HSM `
    -KeyType RSA `
    -ErrorAction Stop `

Write-Host "Key '$cmkName' created on Key Vault" -ForegroundColor Green

# Create secret for SQL Admin
$secretSQLPassword = Read-Host -Prompt 'Enter the SQL Server admin password' -AsSecureString

Set-AzKeyVaultSecret -VaultName $vaultName -Name "SQLAdminPassword" -SecretValue $secretSQLPassword

Write-Host "SQL Admin Password created successfully!" -ForegroundColor Green
