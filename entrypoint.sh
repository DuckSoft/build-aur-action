#!/bin/bash

git clone "https://aur.archlinux.org/$1.git"
cd "$1"
makepkg -sf --noconfirm --skippgpcheck
