#!/bin/bash

# Step 1: Create an empty array
buildings=()

# Step 2: Prompt the user to enter building names
echo "Enter building names one by one. Type 'done' when finished:"

while true; do
    read -r building
    if [[ "$building" == "done" ]]; then
        break
    fi
    buildings+=("$building")
done

# Step 3: Define the output file
output_file="$HOME/Desktop/buildings.txt"

# Step 4: Use a for-loop to append each building to the file
for b in "${buildings[@]}"; do
    echo "$b" >> "$output_file"
done

echo "Buildings have been saved to $output_file"