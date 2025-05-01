#!/bin/zsh

# Create file using a Here Doc
cat << EOF > ~/Desktop/employeeInfo.csv
Brandon,Ross,Wisconsin
Cecelia,Bates,Ohio
Kelly,Riff,Nevada
EOF

# Save default IFS
SAVEIFS=$IFS

# Chang IFS to a comma
IFS=,

# While loop to read in values from a CSV File
while read firstName lastName homeTown; do
echo "$lastName, $firstName hails from $homeTown"
done < ~/Desktop/employeeInfo.csv

# Change IFS back to default value
IFS=$SAVEIFS