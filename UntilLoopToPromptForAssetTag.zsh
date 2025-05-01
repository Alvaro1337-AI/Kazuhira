#!/bin/zsh

result=0

until (("${#result} == 6)); do
	result=$(osascript -e 'text returned of (display dialog "Enter your Asset Tag" default answer "123" buttons {"OK"} default button 1)')
done

/usr/local/jamf/bin/jamf recon -assetTag "$result"