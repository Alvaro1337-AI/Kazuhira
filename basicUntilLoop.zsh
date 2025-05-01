#!/bin/zsh

# Basic Until Loop

var=0

until ((var == 10)); do
	echo "The number is currently : $var"
	sleep .5
	((var += 1))
done

echo Done