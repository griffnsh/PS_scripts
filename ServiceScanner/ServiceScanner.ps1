$ServicesFilePath = "C:\Users\griff\Desktop\PS_scripts\ServiceScanner\Services.csv"
$LogPath = "C:\Users\griff\Desktop\PS_scripts\ServiceScanner\logs"
$LogFile = "Services-$(Get-Date -Format "yyyy-MM--dd hh-mm").txt"
$ServicesList = Import-CSV -Path $ServicesFilePath -Delimiter ','

foreach ($Service in $ServicesList) {
    $CurrentServiceStatus = (Get-Service -Name $Service.Name).status

    if ($Service.Status -ne $CurrentServiceStatus) {
        $Log = "Service : $($Service.Name) is currently $CurrentServiceStatus, should be $($Service.Status)"
        Write-Output $Log
        Out-File -FilePath "$LogPath\$LogFile" -Append -InputObject $Log

        $Log = "Setting $($Service.Name) to $($Service.Status)"
        Write-Output $Log
        Out-File -FilePath "$LogPath\$LogFile" -Append -InputObject $Log
        Set-Service -Name $Service.Name -Status $Service.Status

        $AfterServiceStatus = (Get-Service -Name $Service.Name).Status
        if ($Service.Status -eq $AfterServiceStatus) {
            $Log = "Action was successful Service $($Service.Name) is now $AfterServiceStatus"
            Write-Output $Log
            Out-File -FilePath "$LogPath\$LogFile" -Append -InputObject $Log
        } else {
            $Log = "Action failed -- Service $($Service.Name) is now $AfterServiceStatus should be $($Service.Status)"
            Write-Output $Log
            Out-File -FilePath "$LogPath\$LogFile" -Append -InputObject $Log
        }
    }
}