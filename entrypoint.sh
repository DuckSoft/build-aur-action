#!/bin/bash

# if there is no dependencies in AUR
# git clone "https://aur.archlinux.org/$1.git"
# cd "$1"
# makepkg -sf --noconfirm

# creat a new user to run aur helper `yay` (which can not run under root)
useradd build -m
# passwordless sudo access
echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# install yay
git clone "https://aur.archlinux.org/yay.git" /tmp/yay
cd /tmp/yay
makepkg -sf --install --noconfirm
cd -

# build packages
sudo -u build yay -Sw $1 --noconfirm
pwd
