set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'bendecoste/gitsplit'
Bundle 'Lokaltog/vim-easymotion'
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }
Bundle 'chriskempson/base16-vim'
Bundle 'Raimondi/delimitMate'

" Config {
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

  let g:airline_powerline_fonts=1

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
    set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*/.tox/*,*.egg-info/*,node_modules*
    set wildmenu
    set wildmode=list:longest,full
  "}

  " Mappings {
    let g:syntastic_enable_signs=1
    let g:syntastic_disabled_filetypes = ['html']
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
    :let g:ctrlp_map = '\t'
    :let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
    :let g:ctrlp_dotfiles = 0
" }

" Functions {
  "toggle between relative and absolute line numbering
  function! ToggleNumber()
    if(&relativenumber == 1)
      set number
    else
      set relativenumber
    endif
  endfunc

  nnoremap <C-l> :call ToggleNumber()<cr>

  fun! <SID>StripTrailingWhitespaces()
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      call cursor(l, c)
  endfun
  autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" }

set background=dark
colorscheme grb256

" Other color options {
	" hi StatusLine cterm=bold
	" hi StatusLineNC cterm=bold
" }

let g:EasyMotion_leader_key = ','

" command! -complete=shellcmd -nargs=+ GitSplit call s:RunShellCommand('git show '.<q-args>)
" function! s:RunShellCommand(cmdline)
"   echo a:cmdline
"   let expanded_cmdline = a:cmdline
"   for part in split(a:cmdline, ' ')
"      if part[0] =~ '\v[%#<]'
"         let expanded_part = fnameescape(expand(part))
"         let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
"      endif
"   endfor
"   botright vnew
"   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"   execute '$read !'. expanded_cmdline
"   setlocal nomodifiable
"   set filetype=javascript
"   1
" endfunction

" fun! GitSplit(arg)
"   RunShellCommand(a:arg)
" endfun

" command -nargs=* Gitsplit execute GitSplit('<args>')
