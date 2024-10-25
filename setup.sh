#!/bin/bash


if [ "$EUID" -ne 0 ]; then
echo "Please run as root"
exit 1
fi

usage() {
    echo "Usage: $0 [-g] [-s] [-c] [-h]"
    echo "Options:"
    echo "  -g           Setup Gowitness."
    echo "  -s           Setup sshfs-server."
    echo "  -c           Connect sshfs-client."
    echo "  -h           Display the help message"
}



while getopts 'scgh' flag; do
    case "${flag}" in
        s) echo "Setup sshfs-server"
        $(pwd)/scripts/base_install.sh
        $(pwd)/scripts/sshfs_setup.sh
        ;;
        c) echo "Setup sshfs-client"
        $(pwd)/scripts/base_install.sh
        $(pwd)/scripts/sshfs_connect.sh
        ;;
        g) echo "Setup gowitness"
        $(pwd)/scripts/base_install.sh
        $(pwd)/scripts/gowitness_setup.sh
        ;;
        h) usage
        ;;
        *) echo "Invalid argument"
        usage
        exit 1
        ;;
    esac
done



