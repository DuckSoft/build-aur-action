#!/bin/bash

export PACKAGER="antman666 <945360554@qq.com>"

git clone "https://github.com/antman666/$1.git"
cd "$1"
LIST=`ls -F`
if [[ `echo $LIST | if grep -q "/$";then echo 1;fi` == 1 ]]; then
		for DIR in $LIST; do
				cd $DIR
				makepkg -sf --noconfirm --skippgpcheck
				mv *.zst ..
		done
else
		makepkg -sf --noconfirm --skippgpcheck
fi
