# Set path for DHCP lease store
$outputFile = "C:\DHCP_Leases.csv"

$header = @("ScopeId", "IPAddress", "HostName", "ClientID", "AddressState")

$leases = Get-DhcpServerv4Lease -ComputerName "WIN-ORANGE001"

$leases | Select-Object ScopeId, IPAddress, HostName, ClientId, AddressState | 
    Export-Csv -Path $outputFile -Delimiter ';' -NoTypeInformation -Force

Write-Output "DHCP leases have been exported to $outputFile"
