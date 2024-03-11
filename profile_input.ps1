# Write a script to gather someones full name, their job title, years of experience and where they are from

# Name

$name = Read-Host -prompt "Input your full name"
$jobTitle = Read-Host -prompt "Input your job title"
$experience = Read-host -prompt "Input your years of experience (as a number)"
$location = Read-Host -prompt "Input where you are from (City, State)"

Write-Host "Your name is $name, you are a $jobTitle with $experience years of experience and you are from $location."