#!/bin/bash

sudo apt update
sudo apt install -y git ansible

mkdir ~/personal
cd ~/personal
git clone -b ubuntu https://github.com/LavishPrince/ansible

cd ~/personal/ansible
sudo apt update
sed -i '/- include_tasks: .\/tasks\/docker.yaml/d' init.yaml
ansible-playbook init.yaml --ask-vault-pass
ansible-playbook init.yaml --ask-vault-pass --tags=sshkey
