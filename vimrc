"required
set nocompatible
filetype off

"bash-shell (in case you ain't using it)
set shell=/bin/bash

"line numbering
set nu

"no swap files
set noswapfile

"utf-8 support
set encoding=utf-8

"put all plugins under my vim bundle
set rtp+=~/.vim/bundle/Vundle.vim

"use vundle to manage all (most) plugins
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"filesystem view
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

"code-folding
Plugin 'tmhedberg/SimpylFold'

"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"python autocomplete (doesnt work so well on my mac so letting it go for now)
"Plugin 'davidhalter/jedi-vim'

"colors (mustang)
Plugin 'croaker/mustang-vim'

call vundle#end()

"required (now)
filetype plugin indent on

"follow-ups to the above plugins
"don't want to see .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"code folding
set foldmethod=indent
let g:SimpylFold_docstring_preview = 1

"auto-complete window
let g:ycm_autoclose_preview_window_after_completion=1

"set color
colorscheme desert

"PEP-8 standards"
"I'm gonna stick to this all-over because I use python the most
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

"python-highlighting
let python_highlight_all=1
syntax on

"lang-specific settings other than python