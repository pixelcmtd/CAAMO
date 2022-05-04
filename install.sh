#!/bin/sh
set -uxe

mkdir -p ~/.bin ~/.local/bin

sudo pacman -Syu
yay -S $(cat yay_packs) || \
    for p in $(cat yay_packs) ; do yay -S $p ; done

sudo systemctl enable --now dropbear

# configuration
cp -f env ~/.env
curl -L https://github.com/pixelcmtd/dotfiles/raw/daddy/install | sh -s vim zsh
