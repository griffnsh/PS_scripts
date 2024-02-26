function Generate-RandomPassword {
    param (
        [int]$Length = 12
    )

    $characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+"
    $password = ""

    for ($i = 0; $i -lt $Length; $i++) {
        $randomIndex = Get-Random -Minimum 0 -Maximum $characters.Length
        $password += $characters[$randomIndex]
    }

    return $password
}

# Usage example: Generate a 16-character password
$randomPassword = Generate-RandomPassword -Length 16
Write-Host "Random password: $randomPassword"