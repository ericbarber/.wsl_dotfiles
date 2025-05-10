## WSL Dotfiles Setup

### Manually Adding \~/.wsl\_dotfiles to \$HOME Directory

If you prefer to manually add the `~/.wsl_dotfiles` to your `$HOME` directory, follow these steps:

1. Clone the dotfiles from GitHub:

   ```bash
   git clone git@github.com:ericbarber/.wsl_dotfiles.git ~/.wsl_dotfiles
   ```

2. Verify the directory:

   ```bash
   ls ~/.wsl_dotfiles
   ```

3. If you already have a previous version or want to back up existing dotfiles:

   ```bash
   mv ~/.zshrc ~/.zshrc.bak
   mv ~/.tmux.conf ~/.tmux.conf.bak
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

4. Create symbolic links to the new dotfiles:

   ```bash
   ln -sf ~/.wsl_dotfiles/zsh/.zshrc ~/.zshrc
   ln -sf ~/.wsl_dotfiles/tmux/.tmux.conf ~/.tmux.conf
   ln -sf ~/.wsl_dotfiles/nvim/init.vim ~/.config/nvim/init.vim
   ```

5. Restart your terminal to see the changes.

---

### Installing Tree

Install `tree` to view directory structures:

```bash
sudo apt update
sudo apt install tree -y
```

---

### Installing Zshell (zsh)

Install zsh:

```bash
sudo apt update
sudo apt install zsh -y
```

Set zsh as the default shell:

```bash
chsh -s $(which zsh)
```

Make it fancy with Oh My Zsh:

```bash
ZSH="$HOME/.wsl_dotfiles/.oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Restart zsh:

```bash
exec zsh
```

---

### Installing Tmux

Install tmux:

```bash
sudo apt update
sudo apt install tmux -y
```

Verify the installation:

```bash
tmux -V
```

Create a symbolic link to the custom config:

```bash
ln -sf ~/.wsl_dotfiles/tmux/.tmux.conf ~/.tmux.conf
```
