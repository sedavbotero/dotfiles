#!/bin/bash

SESH="main"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then

    cd ~/

    tmux new-session -d -s $SESH -n

fi

tmux attach-session -t $SESH
