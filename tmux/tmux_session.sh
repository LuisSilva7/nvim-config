#!/bin/bash

# Get the absolute path of the current directory
PROJECT_PATH=$(pwd)

# Session name
SESSION_NAME="tmux_$(basename $PROJECT_PATH)"

# Create a new tmux session in the background
tmux new-session -d -s "$SESSION_NAME" -c "$PROJECT_PATH"

# Window 1 - run neovim in the current directory
tmux rename-window -t "$SESSION_NAME:1" 'nvim'
tmux send-keys -t "$SESSION_NAME:1" 'nvim' C-m

# Window 2 - open terminal in the current directory
tmux new-window -t "$SESSION_NAME:2" -n 'terminal'
tmux send-keys -t "$SESSION_NAME:2" "cd $PROJECT_PATH" C-m
tmux send-keys -t "$SESSION_NAME:2" C-l

# Window 3 - open another terminal in the current directory
tmux new-window -t "$SESSION_NAME:3" -n 'git'
tmux send-keys -t "$SESSION_NAME:3" "cd $PROJECT_PATH" C-m
tmux send-keys -t "$SESSION_NAME:3" C-l

# Window 4 - neovim in the ~/.config/nvim directory
tmux new-window -t "$SESSION_NAME:4" -n 'nvim conf'
tmux send-keys -t "$SESSION_NAME:4" 'cd ~/.config/nvim && nvim' C-m

# Select window 1 as the active one
tmux select-window -t "$SESSION_NAME:1"

# Attach to the tmux session
tmux attach -t "$SESSION_NAME"
