#! bin/bash

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt -y autoclean
sudo apt clean
sudo snap refresh
snap refresh --list
