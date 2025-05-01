#!/bin/zsh

# Get sepecific system extensions 
# systemextensionsctl list

# Get the Designated Requirement

# codesign -dr- /Applications/LuLu.app/

# Get the Bundle ID
codesign -dr --verify --verbose /Applications/LuLu.app/