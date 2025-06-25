# =====================================
# Script to add current public IP to Azure SQL Server firewall
# Author: JhonL2002
# File: AddFirewallRuleForClient.ps1
# =====================================

# VARIABLES

$resourceGroupName = "yourresourcegroupname"
$serverName = "yourservername"
$firewallRuleName = "yourfirewallruelname"

# Remove rule
try {
    Remove-AzSqlServerFirewallRule `
        -ResourceGroupName $resourceGroupName `
        -ServerName $serverName `
        -FirewallRuleName $firewallRuleName `
        -Force
    
    Write-Host "Firewall rule '$firewallRuleName' removed successfully!" -ForegroundColor Green
}
catch {
    Write-Error "Error occurred removing firewall rule: $_"
}