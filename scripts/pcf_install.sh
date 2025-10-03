#!/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

cd /opt

git clone https://gitlab.com/invuls/pentest-projects/pcf.git

cd /opt/pcf

docker compose up -d