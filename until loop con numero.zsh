#!/bin/zsh

until [[ $magicNumber == 42 ]]; 
do
	magicNumber=$(osascript -e 'text returned of(display dialog "What is the Magic Number?" default answer "?" buttons {"guess"} default button 1)')
done

osascript -e 'display dialog "Dont go hollow!" buttons {"motherfucker!"} default button 1'