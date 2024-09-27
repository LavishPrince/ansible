#!/bin/bash

sudo apt update
sudo apt install -y git ansible

mkdir ~/personal
cd ~/personal
git clone https://github.com/LavishPrince/ansible

cd ~/personal/ansible
sudo apt update
ansible-playbook init.yaml --ask-vault-pass
ansible-playbook init.yaml --ask-vault-pass --tags=sshkey
