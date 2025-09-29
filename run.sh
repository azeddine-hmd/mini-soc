#!/bin/sh

export MY_UID="$(id -u)"
export MY_GID="$(id -g)"
ansible-galaxy collection install community.docker || exit 1
ansible-playbook -i ansible/inventory.ini ansible/deploy-wazuh.yml || exit 1
