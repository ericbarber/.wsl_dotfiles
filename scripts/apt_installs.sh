#!/bin/bash

set -e

# Check for existing installations
check_installed() {
    command -v "$1" >/dev/null 2>&1
}

# Clone the dotfiles from GitHub if not already present
if [ ! -d "$HOME/.wsl_dotfiles" ]; then
    echo "Cloning .wsl_dotfiles from GitHub..."
    git clone git@github.com:ericbarber/.wsl_dotfiles.git "$HOME/.wsl_dotfiles"
else
    echo ".wsl_dotfiles already exists. Pulling latest changes..."
    cd "$HOME/.wsl_dotfiles" && git pull
fi

# Install nvim, tmux, and zsh if not installed
for tool in nvim tmux zsh; do
    if check_installed "$tool"; then
        echo "$tool is already installed. Skipping..."
    else
        echo "Installing $tool..."
        sudo apt-get update
        sudo apt-get install -y "$tool"
    fi
done

# Setting up Zsh as the default shell
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Changing the default shell to zsh..."
    chsh -s /usr/bin/zsh
fi

# Set up nvim configuration
if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Creating nvim config directory..."
    mkdir -p "$HOME/.config/nvim"
fi
ln -sf "$HOME/.wsl_dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"
echo "NVim configuration linked to ~/.wsl_dotfiles/nvim/init.vim"

# Set up tmux configuration
ln -sf "$HOME/.wsl_dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
echo "Tmux configuration linked to ~/.wsl_dotfiles/tmux/.tmux.conf"

# Set up Zsh configuration
ln -sf "$HOME/.wsl_dotfiles/zsh/.zshrc" "$HOME/.zshrc"
echo "Zsh configuration linked to ~/.wsl_dotfiles/zsh/.zshrc"

# Success message
echo "Installation and configuration completed successfully!"
