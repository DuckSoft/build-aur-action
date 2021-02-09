#!/bin/bash

cat << EOM >> /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
EOM

git clone "https://aur.archlinux.org/$1.git"
cd "$1"
makepkg -sf --noconfirm
