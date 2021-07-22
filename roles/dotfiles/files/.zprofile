#!/bin/bash

emulate sh -c 'source /etc/profile'

bash ~/.config/tty-theme/theme.sh

# Fix time format bc the bash format is 10/10 better
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

# VIM
export VISUAL=vim
export EDITOR="$VISUAL"

