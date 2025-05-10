#!/bin/bash
# Install Oh My Zsh into ~/.wsl_dotfiles/.oh-my-zsh

# Set the custom installation directory
ZSH="$HOME/.wsl_dotfiles/.oh-my-zsh"

# Download and install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Update .zshrc to point to the custom location
sed -i "s|^export ZSH=.*|export ZSH=\"$ZSH\"|g" ~/.wsl_dotfiles/.zshrc

# Symlink the .zshrc
ln -sf ~/.wsl_dotfiles/.zshrc ~/.zshrc

# Source the new configuration
source ~/.zshrc

echo "Oh My Zsh installed in $ZSH and configured!"
