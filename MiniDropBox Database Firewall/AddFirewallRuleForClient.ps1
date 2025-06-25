# =====================================
# Script to add current public IP to Azure SQL Server firewall
# Author: JhonL2002
# File: AddFirewallRuleForClient.ps1
# =====================================

# VARIABLES

$resourceGroupName = "yourresourcegroupname"
$serverName = "yourservername"
$firewallRuleName = "yourfirewallruelname"

# Get public IP
try {
    $myIP = (Invoke-RestMethod -Uri "https://api.ipify.org")
    Write-Host "Your public IP is: $myIP" -ForegroundColor Cyan
}
catch {
    Write-Error "Cannot getting public IP. Verify internet connection"
    return
}

# Add firewall rule
try {
    New-AzSqlServerFirewallRule `
        -ResourceGroupName $resourceGroupName `
        -ServerName $serverName `
        -FirewallRuleName $firewallRuleName `
        -StartIpAddress $myIP `
        -EndIpAddress $myIP
    
    Write-Host "Firewall rule '$firewallRuleName' created for IP '$myIP'" -ForegroundColor Green
}
catch {
    Write-Error "An error occurred creating firewall rule: $_"
}