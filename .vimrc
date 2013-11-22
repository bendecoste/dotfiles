set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'stash/syntastic'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'bendecoste/vim-togglenumber'
Bundle 'bendecoste/vim-whitespace'

" Config {
  filetype plugin indent on
  syntax on
  set nobackup
  set noswapfile
  set backspace=indent,eol,start
  set colorcolumn=80
  set nocompatible
  set completeopt=menu,menuone
  set confirm
  set encoding=utf-8
  set hidden
  set history=1000
  set hlsearch
  set ignorecase
  set incsearch
  set laststatus=2
  set linebreak
  set scrolljump=10
  set showcmd
  set smartcase
  set nostartofline
  set termencoding=utf-8
  set nowrap
  set expandtab
  set smarttab
  set autoindent

  " tab width {
    set ts=2
    set shiftwidth=2
  " }
  " Folding {
		" set foldcolumn=0
		" set foldenable
		" set foldlevel=0
		" set foldmethod=marker
		" set foldtext=FoldText()
  "}
  " wildmenu {
    set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*/.tox/*,*.egg-info/*
    set wildmenu
    set wildmode=list:longest,full
  "}

  " Mappings {
    let g:syntastic_enable_signs=1
    let g:syntastic_disabled_filetypes = ['html']
    let mapleader="\\"

    :nmap <silent> <c-q> /<c-r>//e<cr>:let @/='<c-r>/'<cr>
    :nmap \p :set paste!<CR>
    :nmap j gj
    :nmap k gk
    :nmap \e :e#<CR>
    :nmap <C-n> :bnext<CR>
    :nmap <C-p> :bprev<CR>
    :nmap \; :CtrlPBuffer<CR>
    :nmap \o :nohl<CR>
  " }

  " ctrlP options {
    :let g:ctrlp_map = '<Leader>t'
    :let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
    :let g:ctrlp_dotfiles = 0
  " }
" }

" Functions {
  "toggle between relative and absolute line numbering
  set relativenumber
  nnoremap <C-l> :call ToggleNumber()<cr>

  fun! <SID>StripTrailingWhitespaces()
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      call cursor(l, c)
  endfun
  autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" }

let g:solarized_termcolors=256
let g:solarized_termtrans=2 " makes the background not change color
set background=dark
" colorscheme solarized
colorscheme grb256
" colorscheme dw_green

" Other color options {
	" hi StatusLine cterm=bold
	" hi StatusLineNC cterm=bold
" }

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

