#!/bin/zsh

# Use Defaults command to write a Safari plist file for enforcement

defaults write ~/Desktop/com.apple.Safari.plist NewWindowBehavior -int 0
defaults write ~/Desktop/com.apple.Safari.plist Homepage https://trainingcatalog.jamf.com

# Use plutil to convert the plist file created by defaults from a binary to XML

plutil -convert xml1 ~/Desktop/com.apple.Safari.plist