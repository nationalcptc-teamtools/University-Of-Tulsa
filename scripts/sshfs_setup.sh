#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

PASSWORD=CHANGEME

useradd c6

echo "c6:$PASSWORD" | chpasswd

mkdir -p /mnt/share
chown c6:c6 /mnt/share
chmod 755 /mnt/share
setfacl -d -m u:c6:rwx /mnt/share
