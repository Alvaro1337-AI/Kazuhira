#!/bin/zsh

cat << EOF > ~/Desktop/info.csv
ijames,JAMF1234,$RANDOM,48
EOF

# cat ~/Desktop/info.csv

# IFS is the Internal Field Separator. By deault a space
# SAVE OLD IFS FIRST
SAVEIFS=$IFS

# Set new IFS
IFS=,

# Read individual columns from a CSV
read username assetTag pagesPrinted roomNumber < ~/Desktop/info.csv

# Recall Variables
echo "The user $username is in room $roomNumber and has the device with asset tag $assetTag"

IFS=$SAVEIFS