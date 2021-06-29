#!/bin/bash

export PACKAGER="antman666 <945360554@qq.com>"

git clone "https://aur.archlinux.org/$1.git"
cd "$1"
makepkg -sf --noconfirm --skippgpcheck
