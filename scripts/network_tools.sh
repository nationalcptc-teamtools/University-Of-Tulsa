#!/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

packages=( "libkrb5-dev" "krb5-user" "ldap-utils" "smbclient" )

for package in "${packages[@]}"; do
  if ! dpkg -l | grep -q $package; then
    apt-get install -y $package
  fi
done

python3 -m pip install --user pipx
python3 -m pipx ensurepath

/usr/bin/pipx install git+https://github.com/fortra/impacket.git
/usr/bin/pipx install git+https://github.com/ly4k/Certipy.git
/usr/bin/pipx install git+https://github.com/Pennyw0rth/NetExec
/usr/bin/pipx install git+https://github.com/dirkjanm/BloodHound.py.git@bloodhound-ce

cd /opt

wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Rubeus.exe
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Certify.exe

wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O kerbrute

git clone https://github.com/dirkjanm/krbrelayx.git

mkdir -p /opt/zerologon && cd /opt/zerologon
wget https://github.com/SecuraBV/CVE-2020-1472/raw/master/zerologon_tester.py
wget https://github.com/dirkjanm/CVE-2020-1472/raw/master/cve-2020-1472-exploit.py
wget https://github.com/dirkjanm/CVE-2020-1472/raw/master/restorepassword.py

mkdir -p /opt/chisel && cd /opt/chisel
wget https://github.com/jpillora/chisel/releases/download/v1.10.1/chisel_1.10.1_linux_amd64.gz
wget https://github.com/jpillora/chisel/releases/download/v1.10.1/chisel_1.10.1_windows_amd64.gz
gunzip chisel_1.10.1_linux_amd64.gz && mv chisel_1.10.1_linux_amd64 chisel
gunzip chisel_1.10.1_windows_amd64.gz && mv chisel_1.10.1_windows_amd64 chisel.exe