#!/bin/bash

install_homebrew() {
  echo "Installing Homebrew (macOS)..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add to PATH (often handled by the installer, but good to include)
  if [[ -f $HOME/.zshrc ]]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>$HOME/.zshrc
    source $HOME/.zshrc
  elif [[ -f $HOME/.bashrc ]]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>$HOME/.bashrc
    source $HOME/.bashrc
  fi

  echo "Homebrew installed."
}

install_linuxbrew() {
  echo "Installing Linuxbrew (Linux)..."
  sudo apt-get update # Update package list
  sudo apt-get install -y build-essential curl file git

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -f $HOME/.zshrc ]]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shell)"' >>$HOME/.zshrc
    source $HOME/.zshrc
  elif [[ -f $HOME/.bashrc ]]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shell)"' >>$HOME/.bashrc
    source $HOME/.bashrc
  fi

  echo "Linuxbrew installed."
}

# Function to install Nix (macOS)
install_nix_macos() {
  echo "Installing Nix (macOS)..."
  sh <(curl -L https://nixos.org/nix/install)
  echo "Nix installed. You may need to open a new terminal or source your shell configuration file (e.g., ~/.zshrc, ~/.bashrc) for the changes to take effect."
}

# Function to install Nix (Ubuntu/Linux)
install_nix_linux() {
  echo "Installing Nix (Linux)..."
  sh <(curl -L https://nixos.org/nix/install) --daemon
  echo "Nix installed. You may need to open a new terminal or source your shell configuration file (e.g., ~/.zshrc, ~/.bashrc) for the changes to take effect."

}
# Check if the OS is macOS
if [[ "$(uname -s)" == "Darwin" ]]; then
  echo "macOS detected. Running mac.sh"
  install_homebrew
  install_nix_macos
  ./mac.sh
elif [[ "$(uname -s)" == "Linux" ]]; then
  echo "Linux detected. Running linux.sh"
  install_homebrew
  install_nix_linux
  ./linux.sh
else
  echo "Unknown operating system detected."
fi

cp ../sshkeys/* $HOME/.ssh/
ansible-vault decrypt $HOME/.ssh/LavishPrince
ansible-vault decrypt $HOME/.ssh/Vinaydg
