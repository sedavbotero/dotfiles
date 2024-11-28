#!/bin/bash

SESH="SOP"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then

    cd ~/Documents/STUDIA/Semestr\ 3/SOP

    tmux new-session -d -s $SESH -n "editor"
    # tmux send-keys -t $SESH:editor "clear" C-m
    tmux send-keys -t $SESH:editor "nvim ." C-m

    tmux new-window -t $SESH -n "bash"

    tmux new-window -t $SESH -n "man"

fi

tmux attach-session -t $SESH
