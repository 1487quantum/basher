#!/bin/bash

#********************************************************************
#
# Bash Chessboard generator
# Version 1.0.1
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

# Vars
gridSize=8				#Box size (Only even number)
boxSize=8				#Grid dimension, even number
heightOffset=$(($boxSize/2))		#Offset box height, as the char height>width
width=$(tput cols)			#Width of console
title="Chess Grid ($gridSize X $gridSize)"
C_BLACK=0
C_WHITE=7		#Change it to 1 for red!
flip_h=0			#Detrmines when to alternate colors, height
flip_w=0			#Detrmines when to alternate colors, width

# Toggle the color, where $1 is the flip var
flipVal () {
	return $((1-$1))
}

# Increment counter
goUp (){
	return $(($1+1))	# Increment by 1
}

clear
tput cup 2 $(((width / 2)-(${#title} / 2)))		#Width & height, offset width by length of title
tput bold;   
printf "$title\n\n";   
tput sgr0
j=0
k=0

for h in $(eval echo {1..$(($gridSize*$boxSize/2))}); do
	tput cup $((4+$h)) $(((width / 2)-($gridSize*$boxSize/2 )))
        for w in $(eval echo {1..$(($gridSize*$boxSize))} ); do
		case $(($flip_w)) in
		 0)  [ $flip_h == 0 ] && a=$C_BLACK || a=$C_WHITE ;;		#If $fg_color % 2 = 0, make it black, else white
		 1)  [ $flip_h == 0 ] && a=$C_WHITE || a=$C_BLACK ;;
		esac
	set_background=$(tput setab $a)		#Set color

	echo -n $set_background
	printf ' '		#Print blank for bg color
	#Check width
	if [ $k == $(($boxSize-1)) ]; then
		k=0
		flipVal $flip_w			#Pass flip value to fx
		flip_w=$?			#Get the return value from flipVal fx
	else
		goUp $k				#Increment by 1		
		k=$?
	fi
        done
        echo $(tput sgr0)
	#Check height
	if [ $j == $(($boxSize-1-$heightOffset)) ]; then
		j=0
		flipVal $flip_h			#Pass flip value to fx
		flip_h=$?			#Get the return value from flipVal fx
	else
		goUp $j				#Increment by 1		
		j=$?
	fi
    done
printf "\n\n"
