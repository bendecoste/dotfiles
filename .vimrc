set nocompatible
filetype off 
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'stash/syntastic'
Bundle 'Lokaltog/vim-powerline'
" Bundle 'Lokaltog/powerline'
"Bundle 'flazz/vim-colorschemes'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'roman/golden-ratio'

"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"disable golden ratio
let g:loaded_golden_ratio=1

" no swap files
set noswapfile

"amazing
set relativenumber
"set number

let g:Powerline_symbols = 'fancy'

" lots of colors!
set t_Co=256

syntax enable
colorscheme jellybeans
set background=dark
"syntax on

" set ts=4
" set shiftwidth=4

set ts=2
set shiftwidth=2

" set ruler
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
set colorcolumn=80

set cmdheight=2

"search for files like bash
set wildmode=list:longest

let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes = ['html']
let mapleader=","

:nmap <silent> <c-q> /<c-r>//e<cr>:let @/='<c-r>/'<cr>
:nmap \p :set paste!<CR>
:nmap j gj
:nmap k gk
:nmap \e :e#<CR>
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>
:nmap ; :CtrlPBuffer<CR>
:nmap \o :nohl<CR>

" ctrlP options
:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_dotfiles = 0

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

"macroz
let @l='[mV$%>'

let g:syntastic_javascript_jshint_conf = ".jshintrc.node"
function! ToggleJSHint()
  if !exists("b:syntastic_javascript_jshint_conf")
    let b:syntastic_javascript_jshint_conf = g:syntastic_javascript_jshint_conf
  endif

  if b:syntastic_javascript_jshint_conf == ".jshintrc.node"
    let b:syntastic_javascript_jshint_conf = ".jshintrc.browser"
    echo "Syntastic now in BROWSER MODE"
  else
    let b:syntastic_javascript_jshint_conf = ".jshintrc.node"
    echo "Syntastic now in NODE MODE"
  endif

endfunc

:nmap \j :call ToggleJSHint()<CR>
