# Get connected devices, store in a variable, write the variable / devices to a .txt file

$connectedDevices = Get-PnpDevice -PresentOnly
Add-Content -Path "C:\Users\griff\Documents\devices.txt" -Value ($connectedDevices)