#!/bin/bash

# Function to check if a package is installed
is_installed() {
  command -v $1 &>/dev/null
}

echo "Updating system..."
sudo apt update -y && sudo apt upgrade -y

if ! is_installed zsh; then
  echo "Installing Zsh..."
  sudo apt install -y zsh
else
  echo "Zsh is already installed."
fi

if ! is_installed curl; then
  echo "Installing curl..."
  sudo apt install -y curl
else
  echo "curl is already installed."
fi

if ! is_installed git; then
  echo "Installing git..."
  sudo apt install -y git
else
  echo "git is already installed."
fi

if ! is_installed python3; then
  echo "Installing Python3..."
  sudo apt install -y python3 python3-pip python3.12-venv
else
  echo "Python3 is already installed."
fi

if ! is_installed node; then
  echo "Installing Node.js..."
  sudo apt install -y nodejs npm
else
  echo "Node.js is already installed."
fi

if ! is_installed rustup; then
  echo "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "Rust is already installed."
fi

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

# Set Zsh as the default shell if not already set
if [ "$(echo $SHELL)" != "$(which zsh)" ]; then
  echo "Setting Zsh as the default shell..."
  chsh -s $(which zsh)
else
  echo "Zsh is already the default shell."
fi

# Install Zsh autosuggestions plugin if not already installed
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  echo "Installing Zsh autosuggestions plugin..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
  echo "Zsh autosuggestions plugin is already installed."
fi

# Install Starship if not already installed
if ! is_installed starship; then
  echo "Installing Starship..."
  curl -sS https://starship.rs/install.sh | sh
else
  echo "Starship is already installed."
fi

mkdir ~/.config/
cp ./starship.toml ~/.config/
cp ./exportador ~/

{
  echo 'export ZSH="$HOME/.oh-my-zsh"'
  echo 'ZSH_THEME="robbyrussell"'
  echo 'plugins=(git zsh-autosuggestions)'
  echo 'source $ZSH/oh-my-zsh.sh'
  echo 'eval "$(starship init zsh)"'
  echo 'echo "export LC_ALL=en_US.UTF-8"'
} >> ~/.zshrc

echo "Installation complete! Please restart your terminal for changes to take effect."
