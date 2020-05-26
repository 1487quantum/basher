#!/bin/bash
VERSION="1.0.0"
DES="> A simple tool to check the versions of libraries installed"
#********************************************************************
#
# Bash Library Version Checker
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

#Formatting
bd=$(tput bold)
nm=$(tput sgr0)
rv=$(tput rev) #Highlight

#Fx
usage() { 
printf "
${rv}
Bash Library Check
Version $VERSION
${nm}
$DES
${sep}
" 
}


sep (){	#Print seperator
printf "=%.0s" {1..20}
printf "\n"
}

findLibExist (){
path=$(ldconfig -p | grep -m 1 $1 ) #Get only 1st result
if [ -z "$path" ]; then
  printf "${rv}$1 not found${nm}\n"
else
  echo "${rv}$1 found${nm} @$path"
  lib_ver=$(ldconfig -p | grep -m 1 $1 | cut -d '=' -f 2 | cut -d '/' -f 5 )
 lv=${lib_ver#*.}
printf "${bd}$1 VERSION: ${lv:3}${nm}\n"
#echo "$(ldconfig -V | grep $1)"
fi
sep
}

usage
while [ -z $args ]; do
echo $args
read -p 'Enter lib: ' args
if [ -z $args ]; then
echo 'Please enter a library name!'
fi
done

sep
for i in $args
do
findLibExist $i
done
