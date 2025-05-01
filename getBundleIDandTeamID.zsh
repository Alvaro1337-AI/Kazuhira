#!/bin/zsh

## Using the Codesign binary to find the Bundle ID
# --display or -d
# --requirements or -r

codesign -dr --verify --verbose /Applications/CodeRunner.app/