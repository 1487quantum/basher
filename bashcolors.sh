#!/bin/bash

#********************************************************************
#
# Bash Color Palette
# Version 1.0.0
#
# Licensed under the MIT License.
#  __ _  _   ___ ______ ____                    _                   
# /_ | || | / _ \____  / __ \                  | |                  
#  | | || || (_) |  / / |  | |_   _  __ _ _ __ | |_ _   _ _ __ ___  
#  | |__   _> _ <  / /| |  | | | | |/ _` | '_ \| __| | | | '_ ` _ \ 
#  | |  | || (_) |/ / | |__| | |_| | (_| | | | | |_| |_| | | | | | |
#  |_|  |_| \___//_/   \___\_\\__,_|\__,_|_| |_|\__|\__,_|_| |_| |_|
#                              
# Copyright(c) 1487Quantum
#
#********************************************************************

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
