#!/bin/bash

## Jamf Pro Health Check Status

# Use command Substitution to save the value of our curl command in a variable
# -m to set a timeout
# -s to silence progress meters and errors
healthCheckURL=$(curl -m 10 -s https://a300-1a.pro.jamf.training/healthCheck.html)

# echo "$healthCheckURL"

# IF Statement
if [[ "$healthCheckURL" == "[]" ]] ;then
	
echo "Yup, looks good to me..."
else
	
echo "We're gonna need a bigger boat"
echo "$healthCheckURL"
fi
