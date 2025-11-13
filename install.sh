#! /bin/bash

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt -y autoclean
sudo apt clean

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
