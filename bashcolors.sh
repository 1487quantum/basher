#!/bin/bash
width=$(tput cols)
title="BASH COLORS (256)"
clear
tput cup 2 $(((width / 2)-(${#title} / 2)))		#Width & height, offset width by length of title
tput bold;   printf "$title\n\n\n";   tput sgr0
colors=255
set_foreground=$(tput setaf 16)		#Set text color as black
for bg_color in $(eval echo {0..$colors} ); do
	set_background=$(tput setab $bg_color)
	echo -n $set_background$set_foreground
	printf '%03s' $bg_color
done
echo $(tput sgr0)
