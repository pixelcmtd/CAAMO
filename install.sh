#!/bin/sh
mkdir -p ~/.bin

sudo pacman -Syu
sudo pacman -S cockpit
sudo pacman -S yay
sudo pacman -S brave-browser
sudo pacman -S fakeroot
sudo pacman -S dstat
sudo pacman -S gimp
sudo pacman -S imagemagick
sudo pacman -S llvm
sudo pacman -S clang
sudo pacman -S dstat
sudo pacman -S jdk8-openjdk
sudo pacman -S jdk15-openjdk
sudo pacman -S tmux
sudo pacman -S fzf
sudo pacman -S zsh
sudo pacman -S git
sudo pacman -S dosbox
sudo pacman -S blender
sudo pacman -S w3m
sudo pacman -S lynx
sudo pacman -S freecad
sudo pacman -S kicad
sudo pacman -S progress
sudo pacman -S ncdu
sudo pacman -S mpv
sudo pacman -S obs-studio
sudo pacman -S make
sudo pacman -S cmake
sudo pacman -S flex
sudo pacman -S bison
sudo pacman -S yubikey-manager
sudo pacman -S vim
sudo pacman -S emacs
sudo pacman -S steam
sudo pacman -S thunderbird
sudo pacman -S feh
sudo pacman -S rust
sudo pacman -S iotop
sudo pacman -S atop
sudo pacman -S tldr
sudo pacman -S yubioath-desktop
sudo pacman -S yubikey-personalization-gui
sudo pacman -S nmap
sudo pacman -S mupdf
sudo pacman -S zathura
sudo pacman -S gocr
sudo pacman -S wine
sudo pacman -S qrencode
sudo pacman -S unrar
sudo pacman -S yasm
sudo pacman -S vala
sudo pacman -S xclip
sudo pacman -S pandoc
sudo pacman -S ruby
sudo pacman -S fd
sudo pacman -S gradle
sudo pacman -S vbindiff
sudo pacman -S binwalk
sudo pacman -S texlive
sudo pacman -S ninja
sudo pacman -S meson
sudo pacman -S signal-desktop
sudo pacman -S discord
sudo pacman -S dropbear
sudo pacman -S dart
sudo pacman -S flutter

yay -S davinci-resolve-studio
yay -S spotify
yay -S 1password
yay -S ftba
yay -S feed-the-beast-classic
yay -S minecraft-launcher
yay -S tetrio-desktop
yay -S imlib2-heic
yay -S pfetch
yay -S neofetch
yay -S brew
yay -S flashprint
yay -S arduino
yay -S ghidra

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
