#!/bin/bash

cd ~/dotfiles/tmux_scripts

N="$(xprop -root -notype _NET_CURRENT_DESKTOP | cut -d " " -f 3)"

N=$((N+1))



case "$N" in
    1) ./main.sh
    ;;
    2) ./twd.sh
    ;;
    4) ./sop.sh
    ;;
    5) ./java.sh
    ;;
esac
