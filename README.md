# dotfiles

## Setup

**Update base setup:**

```bash
sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoremove && sudo apt -y autoclean && sudo apt clean
```

**Install base apps:**

```bash
sudo apt install -y         \
    bat                     \
    git                     \
    npm                     \
    vlc                     \
    htop                    \
    tmux                    \
    tree                    \
    golang                  \
    neovim                  \
    ripgrep                 \
    bashtop                 \
    alacritty               \
    qbittorrent             \
    fonts-jetbrains-mono
```

**Install OMZ:**

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Install zsh-autosuggestions:**

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

**Install Claude Code:** <https://code.claude.com/docs/en/setup>

**Install Rust:** <https://rust-lang.org/tools/install>
