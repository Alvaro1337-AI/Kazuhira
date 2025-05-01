#!/bin/zsh

# Script to create a LaunchDaemon that will run a script every 15 minutes

daemonPath="/Library/LaunchDaemons/com.JamfTraining.jssCheck.plist"

defaults write "$daemonPath" Label com.JamfTraining.jssCheck
defaults write "$daemonPath" ProgramArguments -array /bin/zsh /Users/Shared/jssCheck.zsh
defaults write "$daemonPath" RunAtLoad -bool true
defaults write "$daemonPath" StartInterval -int 900

chmod 644 "$daemonPath"