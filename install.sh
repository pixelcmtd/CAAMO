#!/bin/sh
mkdir -p ~/.bin

sudo pacman -Syu
sudo pacman -S $(cat pacman_packs) || \
    for p in $(cat pacman_packs) ; do sudo pacman -S $p ; done

yay -S $(cat yay_packs) || \
    for p in $(cat yay_packs) ; do yay -S $p ; done

sudo systemctl enable --now dropbear

#
# configuration
#

./vim

cp -f zshrc "$HOME/.zshrc"
cp -f zshtheme "$HOME/.zshtheme"
cp -f vimrc "$HOME/.vimrc"
