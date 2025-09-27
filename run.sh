#!/bin/sh

ansible-galaxy collection install community.crypto || exit 1
ansible-galaxy collection install community.docker || exit 1

ansible-playbook ansible/deploy-nodes-ssh.yml || exit 1

cd vagrant || exit 1
vagrant up --provider="virtualbox" || exit 1
cd ../ || exit 1

ansible-playbook -i ansible/inventory.ini ansible/deploy-wazuh.yml || exit 1
