#!/bin/zsh

while true; do
	# Prompt the user for input using AppleScript
	userInput=$(osascript -e 'Tell application "System Events" to display dialog "Enter a three-digit number followed by ABC:" default answer ""' -e 'text returned of result')
	
	# Validate input using regex
	if [[ "$userInput" =~ ^[0-9]{3}ABC$ ]]; then
		echo "Valid input received: $userInput"
		break
	else
		# Optionally, show a warning to the user
		osascript -e 'Tell application "System Events" to display dialog "Invalid format. Please enter exactly three digits followed by ABC." buttons {"OK"} default button "OK"'
	fi
done