#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

xrdb merge ~/.Xresources

# Fix time format bc the bash format is 10/10 better
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'
export PANEL_FIFO="/tmp/panel-fifo"

# VIM
export VISUAL=vim
export EDITOR="$VISUAL"

# start some nice programs

#redshift &

~/Scripts/sun &

#wal -i "$(< "${HOME}/.cache/wal/wal")" &

# Natural scrolling on laptop
~/Scripts/scroll &

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#Set monitor
#xrandr --output DP-0 --primary --rate 144
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" -1

#Unlock keyring
#dbus-update-activation-environment --systemd DISPLAY
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK
#export GPG_AGENT_INFO
#export GNOME_KEYRING_CONTROL
#export GNOME_KEYRING_PID

#Urxvt daemon
urxvtd -q -o -f &

#systemctl --user start mopidy

bashbullet2 &

udiskie &

compton &

twmnd &

#panel &

sxhkd &

exec bspwm
