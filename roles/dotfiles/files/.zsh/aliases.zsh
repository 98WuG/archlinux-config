alias ls="exa --color=auto --group-directories-first --icons"
alias vz="glava --desktop -m radial &; glava --desktop &"
alias lf="lf-ueberzug"
flashortho() {
	echo -e "\nPUT KEYBOARD INTO BOOTLOADER MODE NOW!\n"
	if [ -z $1 ];
	then
		i=3
	else
		i=$1
	fi
	while [ $i -gt 0 ]; do
		echo -n "$i..."
		sleep 1
		let i=i-1
	done
	avrdude -p atmega32u4 -P /dev/ttyACM0 -c avr109 -U flash:w:orthodox_rev3_jerry.hex
}
flashsplit() {
	sudo sleep 0
	echo -e "\nPUT KEYBOARD INTO BOOTLOADER MODE NOW!\n"

	i=3
	while [ $i -gt 0 ]; do
		echo -n "$i..."
		sleep 1
		let i=i-1
	done
	sudo avrdude -p atmega32u4 -P /dev/ttyACM0 -c avr109 -U flash:w:lets_split_rev2_jerry.hex
}
alias flashgherkin="sudo avrdude -p atmega32u4 -P /dev/ttyACM0 -c avr109 -U flash:w:gherkin.hex;"
alias flashplanck="sudo dfu-programmer atmega32u4 erase;sudo dfu-programmer atmega32u4 flash .build/planck_rev5_jerry.hex"
settrackball() {
	if [ -z $1 ];
	then
		speed=0.50000
	else
		speed=$1
	fi
	xinput --set-prop "Primax Kensington Eagle Trackball" "Coordinate Transformation Matrix" $speed, 0.000000, 0.000000, 0.000000, $speed, 0.000000, 0.000000, 0.000000, $speed
	xinput --set-prop "Primax Kensington Eagle Trackball" "libinput Accel Speed" -0.75
}
rename-show() {
	SHOWNAME=$1
	SEASON=$2
	QUALITY=$3
	COUNTER=1
	for filename in ./*;
	do
		mv -v "$filename" "$SHOWNAME - S$SEASON E$COUNTER - $QUALITY.mkv"
		COUNTER=$((COUNTER+1))
	done
}
power() {
	sudo nvidia-smi -pl $1
}
flac2mp3() {
	if [[ ! -z "$@" ]];
	then
		for filename in "$@"
		do
			flac -cd "$filename" | lame -b 320 -h - "${filename%.flac}.mp3"
		done
	else
		mkdir -v mp3
		for file in *.flac
		do
			$(flac -cd "$file" | lame -b 320 -h - "./mp3/${file%.flac}.mp3")
		done
	fi
}
alias weather='curl wttr.in/McLean'
#
# Useless aliases below this point

alias :q='exit'
alias starwars='telnet towel.blinkenlights.nl'
emacs() {
	echo "Don't be bad..."
	sleep 1
	echo "Launching vim..."
	sleep 1
	vim $@
}
alias {pico,nano,micro}=emacs
hack() {
	echo -e "Hacking $@"
	sleep 1
	echo -n "Hacking in progress."
	for ((i=0; i < 5; i++));
	do
		sleep 1
		echo -n "."
	done
	echo -n "done"
	sleep 1
	echo -e "\n"
	figlet "hacked $@" -f banner
	sleep 1
	echo -e "\n"
	bash --rcfile <(cat ~/.bashrc; echo "PS1='$1 > '")
}

alias ayy="figlet lmao"
xd() {
	LETTER="d"
	if [ ! -z "$@" ]
	then
		LETTER="$1"
	fi
	echo -n "x"
	while true
	do
		echo -n "$LETTER"
		sleep 0.025
	done
}
hm() {
	echo -n "h"
	while true
	do
		echo -n "m"
		sleep 0.025
	done
}
alias xD="xd D"
im() {
	if [ -z "$1" ]
	then
		echo "No argument given"
		return 1
	else
		echo -n "Nobody's"
		for adj in "$@"
		do
			echo -n " $adj"
		done
		return 0
	fi
}
alias ecksdei=xd

alias fuk="bash"
