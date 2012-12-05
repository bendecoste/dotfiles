set nocompatible
filetype off 
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'flazz/vim-colorschemes'
Bundle 'ervandew/supertab'
Bundle 'altercation/vim-colors-solarized'
Bundle 'roman/golden-ratio'

"disable golden ratio
let g:loaded_golden_ratio=1

" no swap files
set noswapfile

"amazing
set relativenumber
"set number

"let g:Powerline_symbols = 'fancy'

" lots of colors!
set t_Co=256

syntax enable
colorscheme solarized
set background=dark
"syntax on

" set ts=4
" set shiftwidth=4

set ts=2
set shiftwidth=2

set expandtab
set smarttab
set autoindent
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set mouse=a
set shortmess=at

set cmdheight=2

"search for files like bash
set wildmode=list:longest

let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes = ['html']
let mapleader=","

:nmap <silent> <c-q> /<c-r>//e<cr>:let @/='<c-r>/'<cr>

"toggle between relative and absolute line numbering
function! ToggleNumber()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-l> :call ToggleNumber()<cr>

"Swap two strings super easy
function! SwapWord(one, two)
  '<,'>s/\v(haha|gogo)/\={'haha':'gogo','gogo':'haha'}[submatch(0)]/g 
  exe 
endfunction
