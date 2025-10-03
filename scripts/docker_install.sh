#!/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

sudo apt install -y docker.io \
	docker-compose 