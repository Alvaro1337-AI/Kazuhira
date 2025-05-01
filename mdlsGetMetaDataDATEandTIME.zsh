#!/bin/zsh

# mdls "/Applications/Firefox.app/" -name kMDItemLastUsedDate | cut -d " " -f 3,4

mdls "/Applications/VoodooPad.app/" -name kMDItemLastUsedDate | cut -d " " -f 3,4