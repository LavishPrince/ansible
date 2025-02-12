#!/bin/bash

# Function to check if Ansible is installed via Homebrew
is_ansible_installed() {
  brew list ansible &>/dev/null
  return $?
}

# Function to install Ansible using Homebrew
install_ansible() {
  echo "Installing Ansible using Homebrew..."
  brew install ansible
  if [[ $? -eq 0 ]]; then
    echo "Ansible installed successfully."
  else
    echo "Error installing Ansible."
    exit 1
  fi
}

# Function to run an Ansible command
run_ansible_command() {
  ansible-playbook init.yaml
  if [[ $? -eq 0 ]]; then
    echo "Ansible command executed successfully."
  else
    echo "Error executing Ansible command."
    exit 1
  fi
}

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "Error: Homebrew is not installed. Please install Homebrew first."
  exit 1
fi

# Check if Ansible is installed
if ! is_ansible_installed; then
  install_ansible
fi

# Run the Ansible command
run_ansible_command
