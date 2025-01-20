#!/usr/bin/env bash

if [ -z "$TMUX" ]; then
  echo "This script must be run from within a tmux session."
  exit 1
fi

current_session=$(tmux display-message -p '#S')

# Find the most recently created session excluding the current one
next_session=$(
  tmux list-sessions -F "#{session_name} #{session_created}" \
    | grep -v "^$current_session " \
    | sort -k2 -n \
    | tail -n 1 \
    | awk '{print $1}'
)

if [ -z "$next_session" ]; then
  echo "No other sessions available to switch to."
  exit 0
fi

tmux switch-client -t "$next_session"
tmux kill-session -t "$current_session"
