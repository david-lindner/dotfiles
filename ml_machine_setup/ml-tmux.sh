#!/bin/sh
tmux new-session \; \
  split-window -h \; \
  send-keys "htop" C-m \; \
  split-window -v \; \
  send-keys "nvidia-htop" C-m \; \
  select-pane -t 0 \; \
  new-window -a \; \
  split-window -h \; \
  split-window -v \; \
  split-window -v \; \
  select-pane -U \; \
  select-pane -U \; \
  split-window -v \; \
  select-pane -L \; \
  split-window -v \; \
  split-window -v \; \
  select-pane -U \; \
  select-pane -U \; \
  split-window -v \; \
  select-pane -U \; \
  new-window -a \; \
  split-window -h \; \
  split-window -v \; \
  split-window -v \; \
  select-pane -U \; \
  select-pane -U \; \
  split-window -v \; \
  select-pane -L \; \
  split-window -v \; \
  split-window -v \; \
  select-pane -U \; \
  select-pane -U \; \
  split-window -v \; \
  select-pane -U \; \
  new-window -a \; \
  split-window -h \; \
  split-window -v \; \
  split-window -v \; \
  select-pane -U \; \
  select-pane -U \; \
  split-window -v \; \
  select-pane -L \; \
  split-window -v \; \
  split-window -v \; \
  select-pane -U \; \
  select-pane -U \; \
  split-window -v \; \
  select-pane -U \; \
  select-window -t 0


