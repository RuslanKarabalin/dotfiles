#! /bin/bash

sudo apt -y update          &&
    sudo apt -y upgrade     &&
    sudo apt -y autoremove  &&
    sudo apt -y autoclean   &&
    sudo apt -y clean all

sudo apt install            \
    bat                     \
    git                     \
    npm                     \
    vlc                     \
    pipx                    \
    htop                    \
    tmux                    \
    tree                    \
    cmake                   \
    golang                  \
    neovim                  \
    doxygen                 \
    ripgrep                 \
    bashtop                 \
    alacritty               \
    qbittorrent             \
    python3-pip             \
    python3-full            \
    clang-format            \
    fonts-jetbrains-mono

pipx install conan

npm install @anthropic-ai/claude-code

go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@master
