#!/bin/zsh
 
## Get last update info for XProtect
lastUpdate=$(pkgutil --pkgs=".*XProtect.*" | sort -n | tail -1)
 
## Extract the epoch date & time
epoch=$(pkgutil --pkg-info $lastUpdate | awk '/install-time:/{print $2}') 
 
## Convert the date and time into the format required by Jamf Pro in UTC format
readable=$(date -juf %s $epoch +%F\ %T)
 
## Add the result tags for Jamf Pro to read the output
echo "<result>$readable</result>"
 
exit 0