#!/bin/bash

# Populate the array
devices=("iPad" "iPhone" "iMac" "MacBook Pro")

# output file
output_file="device_list.txt"
> "$output_file"

# Iterate
for device in "${devices[@]}"; do
    for number in {1..9}; do
        echo "${device}-${number}" >> "$output_file"
    done
done

# while-loop to read and print
while IFS= read -r line; do
    echo "$line"
done < "$output_file"