#!/bin/bash

SESH="Java"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then

    cd ~/Documents/STUDIA/Semestr\ 3/Java

    tmux new-session -d -s $SESH -n "git"

fi

tmux attach-session -t $SESH
