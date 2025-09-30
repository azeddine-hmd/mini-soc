#!/bin/sh

ansible-playbook -i ansible/inventory.ini ansible/setup.yml || exit 1
ansible-galaxy collection install community.docker || exit 1
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml || exit 1
