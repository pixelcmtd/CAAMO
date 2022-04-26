#!/bin/sh
mkdir -p ~/.bin ~/.local/bin

sudo pacman -Syu
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

gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
