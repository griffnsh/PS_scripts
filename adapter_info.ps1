# Get network adapter information
$networkAdapters = Get-NetAdapter

# Loop through each network adapter
foreach ($adapter in $networkAdapters) {
    Write-Host "Adapter Name: $($adapter.Name)"
    Write-Host "  Description: $($adapter.Description)"
    Write-Host "  Interface Index: $($adapter.InterfaceIndex)"
    Write-Host "  MAC Address: $($adapter.MacAddress)"
    Write-Host "  Status: $($adapter.Status)"
    Write-Host "  Operational Status: $($adapter.OperationalStatus)"
    Write-Host "  Speed (Mbps): $($adapter.LinkSpeed)"
    Write-Host "  IPv4 Address(es):"
    
    # Get IPv4 addresses for the adapter
    $ipv4Addresses = $adapter | Get-NetIPAddress -AddressFamily IPv4
    foreach ($ipv4Address in $ipv4Addresses) {
        Write-Host "    $($ipv4Address.IPAddress)"
    }
    
    Write-Host "  IPv6 Address(es):"
    
    # Get IPv6 addresses for the adapter
    $ipv6Addresses = $adapter | Get-NetIPAddress -AddressFamily IPv6
    foreach ($ipv6Address in $ipv6Addresses) {
        Write-Host "    $($ipv6Address.IPAddress)"
    }
    
    Write-Host "  DNS Server(s):"
    
    # Get DNS servers for the adapter
    $dnsServers = $adapter | Get-DnsClientServerAddress
    foreach ($dnsServer in $dnsServers) {
        Write-Host "    $($dnsServer.ServerAddresses)"
    }
    
    Write-Host "--------------------------"
}
