#!/bin/bash

# export PACKAGER="AntMan666 <945360554@qq.com>"

git clone "https://github.com/antman666/$1.git"
cd "$1"
echo 'PACKAGER="AntMan666 <945360554@qq.com>"' >> /etc/makepkg.conf
updpkgsums
makepkg -sf --noconfirm --skippgpcheck
