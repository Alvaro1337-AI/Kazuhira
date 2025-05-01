#!/bin/bash

# Path to Jamf binary
JAMF="/usr/local/bin/jamf"

# Check if jamf binary exists
if [ ! -x "$JAMF" ]; then
	echo "Jamf binary not found!"
	exit 1
fi

# Update the management framework
"$JAMF" manage

exit 0