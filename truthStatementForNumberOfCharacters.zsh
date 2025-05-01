#!/bin/zsh

result=$(osascript -e 'text returned of (display dialog "Enter your favorite word" default answer "123" buttons {"OK"} default button 1)')

echo ${#result}

if [[ "${#result}" -lt 3 ]]; then
	echo "true"
else 
	echo "false"
fi


# == - IS EQUAL
# != - IS NOT EQUAL
# -gt - Greater Than
# -lt - Less Than