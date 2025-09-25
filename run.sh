#!/bin/sh

vagrant up
ansible-galaxy collection install community.docker
ansible-playbook -i ansible/inventory.ini ansible/deploy-wazuh.yml
