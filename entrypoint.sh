#!/bin/bash

# fail whole script if any command fails
set -e

# if there is no dependencies in AUR
# git clone "https://aur.archlinux.org/$1.git"
# cd "$1"
# makepkg -sf --noconfirm

pkgname=$1

# there should be a subdirectory with the same name of pkgname
# to satisfy `aurpublish`
pkgbuild_dir=$(readlink "$pkgname" -f)

if [[ ! -d $pkgbuild_dir ]]; then
    echo "$pkgbuild_dir should be a directory."
    exit 1
fi

if [[ ! -e $pkgbuild_dir/PKGBUILD ]]; then
    echo "$pkgbuild_dir does not contain a PKGBUILD file."
    exit 1
fi

if [[ ! -e $pkgbuild_dir/.SRCINFO ]]; then
    echo "$pkgbuild_dir does not contain a .SRCINFO file."
    exit 1
fi

# fix directory permissions
sudo chown -R build "$pkgbuild_dir"
sudo chown -R build /github/home

# build packages

install_deps() {
    # install the package dependencies
    grep -E 'depends' .SRCINFO | \
        sed -e 's/.*depends = //' -e 's/:.*//' | \
        xargs yay -S --noconfirm
	# install the package make dependencies
	grep -E 'makedepends' .SRCINFO | \
		sed -e 's/.*depends = //' -e 's/:.*//' | \
		xargs yay -S --noconfirm
}

cd $pkgbuild_dir

## check PKGBUILD
namcap PKGBUILD
# install dependencies
install_deps
# just makepkg
makepkg --syncdeps --noconfirm

cd -
