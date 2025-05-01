#!/bin/zsh

# Basic While Loop

while [[ -e /Applications/Google\ Chrome.app/ ]]; do
	echo "Chrome is installed"
	sleep .3
done

echo "....annnndddd its gone"


# -e is true if something exists
# -f is true if a FILE exists
# -d is true if a directory exists


# == 
# !=
# ! -f - IF the file does not exist
# ! -e 