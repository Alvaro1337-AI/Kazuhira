#!/bin/zsh

## Lesson 14 Task 01
until [[ -e /Users/Shared/file.txt ]]; 
do
	echo "File not found"
	sleep .3
done

echo "File Found!"
