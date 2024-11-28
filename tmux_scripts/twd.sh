#!/bin/bash

SESH="TWD"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then

    cd ~/Documents/STUDIA/Semestr\ 3/TWD

    tmux new-session -d -s $SESH -n "project"
    tmux send-keys -t $SESH:project "cd TWD-Projekt_1" C-m
    tmux send-keys -t $SESH:project "clear" C-m

    tmux new-window -t $SESH -n "labs"
    tmux send-keys -t $SESH:labs "cd laby" C-m
    tmux send-keys -t $SESH:labs "clear" C-m

    tmux new-window -t $SESH -n "homework"
    tmux send-keys -t $SESH:homework "cd homework" C-m
    tmux send-keys -t $SESH:homework "clear" C-m

fi

tmux attach-session -t $SESH
