#!/bin/zsh
# Needs to run as root

# Lesson 12 Task 01

# a. Prompt a user for the ID of a policy
echo "What policy would you like to run? "; read policyID

# b. Execute the specified policy.
# c. Print the output of the policy to a file in /Users/Shared/.
jamf policy -id $policyID > /Users/Shared/policyLog.txt