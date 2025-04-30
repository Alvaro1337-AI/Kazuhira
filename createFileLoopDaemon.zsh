#!/bin/zsh

## Script to create a LaunchDaemon that runs a script on a timer

# Create daemon path variable
daemonPath="/Library/LaunchDaemons/com.JamfTraining.fileLoop.plist"

# Defaults commands to write the Keys
defaults write "$daemonPath" Label com.JamfTraining.fileLoop
defaults write "$daemonPath" ProgramArguments -array /bin/zsh /Users/Shared/fileLoop.zsh
defaults write "$daemonPath" RunAtLoad -bool true
defaults write "$daemonPath" StartInterval -int 60

# Set our Permissions
chmod 755 "$daemonPath"
chown root:wheel "$daemonPath"