#! /bin/bash

sudo apt install            \
    bat                     \
    git                     \
    vlc                     \
    pipx                    \
    htop                    \
    tmux                    \
    tree                    \
    cmake                   \
    golang                  \
    neovim                  \
    ripgrep                 \
    bashtop                 \
    alacritty               \
    qbittorrent             \
    python3-pip             \
    python3-full            \
    clang-format            \
    fonts-jetbrains-mono    \

pipx install conan

go install github.com/go-delve/delve/cmd/dlv@master
go install golang.org/x/tools/gopls@latest
