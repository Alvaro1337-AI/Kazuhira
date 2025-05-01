#!/bin/zsh

## Define Variables
# Define variables as parameters 1 & 2; Set values outside of script

# Jamf Pro Parameter Values are reserved from 1-3; 4-11 are free to utilize
# Parameter 1: Mount Point
# Parameter 2: Computer Name
# Parameter 3: Username

myName="$1"
dayOfWeek="$2"

# Recall Variables
echo "My name is $myName and today is $dayOfWeek"