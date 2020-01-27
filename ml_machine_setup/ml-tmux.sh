#!/bin/sh
tmux new-session \; \
  split-window -h \; \
  send-keys "htop" C-m \; \
  split-window -v \; \
  send-keys "nvidia-htop" C-m \; \
  select-pane -t 0 \; \

