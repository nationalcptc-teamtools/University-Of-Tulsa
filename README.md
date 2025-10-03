# TeamTools
Tools repository for CPTC

## Docker
- [Bloodhound](./docker/bloodhound/docker-compose.yml)
- Pentest Collaboration Framework
    - [Use the following script](./scripts/pcf_install.sh) to clone pcf and run via docker-compose

## DotFiles
- Stuff for shell customization and for Tmux config

## Payloads
- PHP Web Shell: [php_cmdshell.php](./payloads/Webshells/php_cmdshell.php)

## Privilege Escalation
- linpeas.sh: Linux Privilege Escalation script from [Github](https://github.com/peass-ng/PEASS-ng)

## Scripts
- First run [base_install.sh](./scripts/base_install.sh) to get neccessary packages installed and/or any dependancies.
- Also install Docker before some of the other following scripts: [docker_install.sh](./scripts/docker_install.sh)
- Script to install all the network things: [network_tools.sh](./scripts/network_tools.sh)
- To setup GoWitness which is a web screenshot scanner: [gowitness_setup.sh](./scripts/gowitness_setup.sh)
- To install the Pentest Collaboration Framework: [pcf_install.sh](./scripts/pcf_install.sh)
- For setting up a SSH File Server (if needed):
    - Client: [sshfs_connect.sh](./scripts/sshfs_connect.sh)
    - Server: [sshfs_setup.sh](./scripts/sshfs_setup.sh)