# $shell =New-Object -ComObject WScript.Shell

# $shell.Popup("This is a test popup")

# Write script to get disk space, and provide the amount of space left in a pop-up window 

# Get-PSDrive C | Select-Object Free

$drive = Get-PSDrive C
$used = Get-PSDrive C | Select-Object Used
$space = [math]::Round(($drive.Free / 1GB), 2)
$spaceUsed = [math]::Round(($used.Used / 1GB), 2)

$shell = New-Object -ComObject WScript.Shell
$shell.Popup("$space GB / $spaceUsed GB on your C:/")