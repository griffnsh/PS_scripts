# Write a script to have a random num generated from 1-15
# User will input their guess into the prompt
# Prompt will determine if guess is === to random num

$randomNum = Get-Random -Minimum 1 -Maximum 15
$randomGuess = Read-Host "Enter your guess:"

if ($randomGuess -eq $randomNum) {
    write-host "Your guess, $randomGuess was correct!"
} else {
    write-host "Your guess, $randomGuess was incorrect, the correct number is $randomNum"
}

