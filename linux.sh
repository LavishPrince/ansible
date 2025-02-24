#!/bin/bash

source $HOME/.bashrc

# Update package lists
sudo apt update

# Install prerequisites
packages=("feh" "ansible" "build-essential" "curl" "file" "git" "ruby" "ruby-dev" "i3" "polybar" "picom" "rofi" "nodejs" "npm" "apt-transport-https" "ca-certificates" "curl" "gnupg" "lsb-release")

for package in "${packages[@]}"; do
  sudo apt install -y "$package"
done

echo "Prerequisites installed successfully!"

sudo npm install -g n

sudo n 22

echo "Node.js and n installed and version set successfully!"

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt update

packages=("docker-ce" "docker-ce-cli" "containerd.io" "docker-buildx-plugin" "docker-compose-plugin")
for package in "${packages[@]}"; do
  sudo apt install -y "$package"
done

sudo systemctl enable docker
sudo systemctl start docker

echo "Docker installed and started successfully!"

brew update

# Install the packages
packages=("fzf" "xh" "doggo" "neovim" "tmux" "starship" "stow" "eza" "zoxide" "btop" "tlrc" "ripgrep" "ranger" "zsh" "minikube" "kubectl" "helm" "git-delta" "angular-cli" "gitleaks" "rustfmt" "rust-analyzer" "go" "golangci-lint" "gofumpt" "superfile" "posting" "hashicorp/tap/terraform" "infisical/get-cli/infisical" "harlequin")

for package in "${packages[@]}"; do
  if ! /home/linuxbrew/.linuxbrew/bin/brew install "$package"; then
    echo "Error: Failed to install package '$package'"
    exit 1
  fi
done

echo "Packages installed successfully!"

cd dotfiles
git clone https://github.com/junegunn/fzf-git.sh.git $HOME/fzf-git.sh
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm/
/home/linuxbrew/.linuxbrew/bin/stow --adopt -t $HOME home
echo "Dotfiles stowed successfully!"

nix profile install github:guibou/nixGL --impure
nix profile install github:ghostty-org/ghostty
nix profile install nixpkgs#alacritty nixpkgs#devbox

brew install --cask font-jetbrains-mono-nerd-font
fc-cache -v
