#!/usr/bin/env bash

GREEN="\033[32m"
RESET="\033[0m"

session_count=$(tmux list-sessions | wc -l)

# 只有一个 session，不显示 session_name
if [ "$session_count" -eq 1 ]; then
  candidates=$(tmux list-panes -a -F "#{session_name}:#{window_index}.#{pane_index}	#{b:pane_current_path} : ${GREEN}#{pane_current_command}${RESET}")

else
  candidates=$(tmux list-panes -a -F "#{session_name}:#{window_index}.#{pane_index}	#{session_name} : #{b:pane_current_path} : ${GREEN}#{pane_current_command}${RESET}")
fi

selected=$(
  echo -e "$candidates" |
    fzf --ansi --reverse --prompt="> " --with-nth=2..-1
)

[ -z "$selected" ] && exit

TARGET=$(echo "$selected" | cut -d' ' -f1)
tmux switch-client -t "${TARGET%%:*}"
tmux select-window -t "${TARGET%.*}"
tmux select-pane -t "$TARGET"
