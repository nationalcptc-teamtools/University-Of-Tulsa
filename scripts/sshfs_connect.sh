#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

mkdir -p /mnt/share
SSHPASS="CHANGEME" sshfs c6@10.0.254.205:/mnt/share /mnt/share -o ssh_command="sshpass -e ssh -o StrictHostKeyChecking=no"