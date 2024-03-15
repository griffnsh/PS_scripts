# Prompt the user to input their name
$name = Read-Host -Prompt "Please enter your name"

# Generate a random number to select a greeting message
$greetingIndex = Get-Random -Minimum 0 -Maximum 2

# Define an array of greeting messages
$greetings = @(
    "Hello, $name! Have a great day!",
    "Hey there, $name! Hope you're doing well!",
    "Hi, $name! Wishing you a fantastic day!"
)

# Display a random greeting message
Write-Host $greetings[$greetingIndex]
