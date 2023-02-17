#!/bin/bash

carte=wlan0
#carte=wlp3s0
session="RaspberryPi"
tmux new-session -d -s $session

window=0
tmux rename-window -t $window 'Htop'
tmux send-keys -t 'Htop' 'htop' C-m

window=1
tmux new-window -t $session:$window -n 'nload'
tmux rename-window -t $window 'Network'
tmux send-keys -t 'Network' "nload device $carte" C-m

window=2
tmux new-window -t $session:$window -n 'dfc'
tmux rename-window -t $window 'dfc'
tmux send-keys -t 'dfc' 'dfc' C-m
tmux split-window -v
tmux send-keys -t 'dfc' 'ncdu ~' C-m

tmux select-window -t $session:0
#tmux send-keys -t 'C-a 0' C-m
