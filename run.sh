#!/bin/sh

ansible-galaxy collection install community.docker || exit 1
ansible-playbook -i ansible/inventory.ini ansible/deploy-wazuh.yml || exit 1
