# ====================================
# Script to enable TDE with Key Vault key (BYOK)
# Author: JhonL2002
# File: EnableTDEAzureSQLScript.ps1
# ====================================

# VARIABLES
$resourceGroupName = "MiniDropBox0000" # Use the real name created on "CreateKeyVaultScript.ps1"
$serverName = "mysqlservername" # Use the real name created on "CreateKeyVaultScript.ps1"
$vaultName = "kv-mykeyvaultname0000" # Use the real name created on "CreateKeyVaultScript.ps1"
$cmkName = "MiniDropBoxCMK" # Use the real name created on "CreateKeyVaultScript.ps1"

# Get Id key from vault
$key = Get-AzKeyVaultKey -VaultName $vaultName -Name $cmkName
$keyId = $key.Id

# Get principal ID (managed identity from SQL Server)
$server = Get-AzSqlServer -ResourceGroupName $resourceGroupName -ServerName $serverName
$principalId = $server.Identity.PrincipalId

# Set permissions SQL Server to access key
Set-AzKeyVaultAccessPolicy `
    -VaultName $vaultName `
    -ObjectId $principalId `
    -PermissionsToKeys get, wrapKey, unwrapKey `
    -ErrorAction Stop `

Write-Host "Permissions granted to SQL Server" -ForegroundColor Green

# Register key as "Server Key" into SQL Server (Important to do!)
Add-AzSqlServerKeyVaultKey `
    -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -KeyId $keyId `

Write-Host "Permissions applied to SQL Server over TDE key" -ForegroundColor Green

# Apply key like TDE protector
Set-AzSqlServerTransparentDataEncryptionProtector `
    -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -Type AzureKeyVault `
    -KeyId $keyId `
    -AutoRotationEnabled $true `
    -ErrorAction Stop

Write-Host "TDE protector configured with key '$cmkName' from Key Vault '$vaultName'!" -ForegroundColor Green