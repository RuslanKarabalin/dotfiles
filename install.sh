#! /bin/bash

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt -y autoclean
sudo apt -y clean all

sudo apt install            \
    bat                     \
    git                     \
    npm                     \
    vlc                     \
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
    fonts-jetbrains-mono

sudo npm install -g @anthropic-ai/claude-code

go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@master
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
