#!/bin/zsh

cat << EOF > /Users/jamfdemo/Desktop/managementTime.zsh
#!/bin/zsh

# Needs to be run as root
# Script to update the management framework and print the current time to the file: /Users/Shared/managementTime.txt

# Update the management framework
/usr/local/jamf/bin/jamf manage

# Print the current time to a file

echo "A Management Framework Update was completed at: " >> /Users/Shared/managementTime.txt
date -u +%F\ %T >> /Users/Shared/managementTime.txt
echo "" >> /Users/Shared/managementTime.txt
EOF