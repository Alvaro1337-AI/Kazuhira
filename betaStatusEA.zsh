#!/bin/zsh

## Get our Best Enrollment Status
# awk pulls the line that contains "enrolled"
# prints the last field with $NF

sudo /System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil current | awk '/enrolled/{print $4}'

# Store in a variable
betaStatus=$(/System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil current | awk '/enrolled/{print $NF}')

echo "<result>$betaStatus</result>"