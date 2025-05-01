#!/bin/zsh

# Checks to see if the Jamf Pro Server is reachable and output to a file.
jssCheck=$(/usr/local/jamf/bin/jamf checkJSSConnection)

echo "$jssCheck" >> /Users/Shared/jssCheck.txt

# Write out the date to the file
echo "The above JSS Connection Check was done at $(date)" >> /Users/Shared/jssCheck.txt