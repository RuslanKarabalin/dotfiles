#!/bin/bash

cat > /tmp/keybinds.txt << 'EOF'
Super + Q                       Open terminal
Super + C                       Close active window
Super + M                       Exit Hyprland
Super + E                       Open file manager
Super + V                       Toggle floating mode
Super + R                       Open application launcher
Super + P                       Toggle pseudo-tiling
Super + J                       Toggle split direction

Super + Left                    Focus window to the left
Super + Right                   Focus window to the right
Super + Up                      Focus window above
Super + Down                    Focus window below

Super + 1-9                     Switch to workspace 1-9
Super + 0                       Switch to workspace 10
Super + Shift + 1-9             Move window to workspace 1-9
Super + Shift + 0               Move window to workspace 10
Super + S                       Toggle special workspace
Super + Shift + S               Move to special workspace

Super + Scroll Up               Next workspace
Super + Scroll Down             Previous workspace
Super + Left Click (drag)       Move window
Super + Right Click (drag)      Resize window

Print                           Screenshot area + clipboard
Shift + Print                   Screenshot fullscreen + clipboard
Super + Print                   Screenshot area + save
Super + Shift + Print           Screenshot fullscreen + save

Fn + F1                         Toggle mute
Fn + F2                         Volume down
Fn + F3                         Volume up

Fn + F9                         Decrease brightness
Fn + F10                        Increase brightness

Super + L                       Lock screen
Super + I                       Clipboard history
Super + K                       Show this keybindings list
Super + Escape                  Power menu

Win + Space                     Switch keyboard layout
EOF

wofi --dmenu -p "Keybindings" -W 900 -H 700 < /tmp/keybinds.txt
