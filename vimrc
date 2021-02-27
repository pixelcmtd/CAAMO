set nocompatible
let mapleader = " "
execute pathogen#infect()
syntax on
filetype plugin indent on
set laststatus=2
set number relativenumber
set so=999
setglobal fileencoding=utf-8
set encoding=utf-8 termencoding=utf-8 fileencodings=utf-8
set wildmenu wildignore=*.o,*.a,*.la,*.lo,*.swp,.svn,.git
set showcmd
set hlsearch ignorecase smartcase
set backspace=indent,eol,start
set shiftwidth=8 softtabstop=8 expandtab autoindent
set confirm
set visualbell t_vb= t_Co=256
set mouse=a
set spelllang=de,en
set notimeout ttimeout ttimeoutlen=5
set noshowmode
let g:lightline = {'colorscheme': 'powerline'}

autocmd BufWritePost slides !sent %
autocmd BufWritePost slides.md !md2pdf % $(echo % | sed s/.md/.pdf/) && mupdf $(echo % | sed s/.md/.pdf/)
autocmd BufWritePost .vimrc source %
autocmd BufWritePost sources.list !sudo apt update

map <Leader>c "+y
map <Leader>v "+P
" disables search highlighting until the next search is issued
map <Leader>s :nohl<CR><C-L>

if(filereadable("Makefile"))
        map <Leader>t :w<CR>:make test<CR>
        map <Leader>x :w<CR>:make<CR>
        map <Leader>i :w<CR>:!sudo make install<CR>
endif

if(filereadable("Smfile"))
        map <Leader>t :w<CR>:!sm test<CR>
        map <Leader>x :w<CR>:!sm<CR>
        map <Leader>i :w<CR>:!sm install<CR>
endif

autocmd filetype html map <Leader>p i<p><Enter></p><Esc>O

" ZERM setup
map <Leader>z :set spell<CR>:set colorcolumn=0<CR><C-L>
" ZERM source ("Quelle")
" TODO: remove
autocmd filetype html map <Leader>q i<sup><a href="url">[n]</a></sup><Esc>
