#!/bin/bash

if [ "$TERM" = "linux" ]; then
	echo -en "\e]P01b2b34" #black
	echo -en "\e]P865737e" #darkgrey
	echo -en "\e]P1ec5f67" #darkred
	echo -en "\e]P9ec5f67" #red
	echo -en "\e]P299c794" #darkgreen
	echo -en "\e]PA99c794" #green
	echo -en "\e]P3fac863" #brown
	echo -en "\e]PBfac863" #yellow
	echo -en "\e]P46699cc" #darkblue
	echo -en "\e]PC6699cc" #blue
	echo -en "\e]P5c594c5" #darkmagenta
	echo -en "\e]PDc594c5" #magenta
	echo -en "\e]P65fb3b3" #darkcyan
	echo -en "\e]PE5fb3b3" #cyan
	echo -en "\e]P7c0c5ce" #lightgrey
	echo -en "\e]PFd8dee9" #white
	clear
fi
