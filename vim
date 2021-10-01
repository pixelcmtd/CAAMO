#!/bin/sh
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
git clone https://github.com/w0rp/ale ~/.vim/bundle/ale
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
git clone https://github.com/tweekmonster/gofmt.vim.git ~/.vim/bundle/gofmt.vim
ret="$(pwd)"
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer --cs-completer --java-completer --go-completer --rust-completer
cd "$ret"
