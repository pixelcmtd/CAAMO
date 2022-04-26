#!/bin/sh
set -uxe

mkdir -p ~/.bin ~/.local/bin

sudo pacman -Syu
yay -S $(cat yay_packs) || \
    for p in $(cat yay_packs) ; do yay -S $p ; done

sudo systemctl enable --now dropbear

#
# configuration
#

cp -f zshrc "$HOME/.zshrc"
cp -f zshtheme "$HOME/.zshtheme"

cd
git clone https://github.com/pixelcmtd/dotfiles.git
cd dotfiles
cp -f vimrc ~/.vimrc
./vim-plugins

gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
