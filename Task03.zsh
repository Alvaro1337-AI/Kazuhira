#!/bin/zsh

lastOpened=$(mdls "/Applications/Firefox.app/" -name kMDItemLastUsedDate | cut -d " " -f 3,4,5)

echo "<result>$lastOpened</result>"