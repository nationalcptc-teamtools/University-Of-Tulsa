#!/usr/bin/env bash

packages=( "tmux" "sshfs" "sshpass" )

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

for package in "${packages[@]}"; do
  if ! dpkg -l | grep -q $package; then
    apt-get install -y $package
  fi
done