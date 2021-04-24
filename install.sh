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

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
git clone https://github.com/w0rp/ale ~/.vim/bundle/ale
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
git clone https://github.com/tweekmonster/gofmt.vim.git ~/.vim/bundle/gofmt.vim
ret="$(pwd)"
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py $I3B_YCM_FLAGS
cd "$ret"

cp -f zshrc "$HOME/.zshrc"
cp -f zshtheme "$HOME/.zshtheme"
cp -f vimrc "$HOME/.vimrc"
