$ServicesFilePath = "C:\Users\griff\Desktop\PS_scripts\ServiceScanner\Services.csv"

$ServicesList = Import-CSV -Path $ServicesFilePath -Delimiter ','

foreach($Service in $ServicesList) {
    $CurrentServiceStatus = (Get-Service -Name $Service.Name).status

    if($Service.Status -ne $CurrentServiceStatus) {
        $Log = "Service : $($Service.Name) is currently $CurrentServiceStatus, should be $($Service.Status)"
        Write-Output $Log
    }
}