#!/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

mkdir -p /mnt/share/gowitness/screenshots

tmux new-session -s 'gowitness' -d 'gowitness server --screenshot-path /mnt/share/gowitness/screenshots -D sqlite:///mnt/share/gowitness/gowitness.db -a 0.0.0.0:8090'