" Set UTF-8 as default encoding
set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" Set update time for vim-gitgutter
" https://www.reddit.com/r/vim/comments/3ql651/what_do_you_set_your_updatetime_to/
set updatetime=750

" Disable scratch preview window
set completeopt-=preview

" Auto save when back from insert mode
inoremap <silent> jj <ESC>:<C-u>w<CR>

" set very magic command as a normal backslash
nnoremap /  /\v

" Visualize tabs, blanks, and return
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
hi NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=None
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE guifg=None

" Reload files if modified by ohters
set autoread

" No swap files
set noswapfile

" Show commands you input
set showcmd

" Auto completion with tab
set wildmenu

" Prevent cursor from stopping at the first or end of lines
"set whichwrap=b,s,h,l,<,>,[,]

" Search word
set incsearch
set smartcase
set hlsearch
set ignorecase
set wrapscan
set inccommand=split

" Toggle highlight when double clicked a ESC key
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" Color cursor line
set cursorline

" Identation
set autoindent
set smartindent

" Set line number
set number

" Tab size set to 2
"set tabstop=2
"set shiftwidth=2

" Always use spaces instead of tabs
" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab

" Set no wrap
set nowrap

" Link vim's internal clipboard with system
set clipboard&
set clipboard=unnamed

if has('gui')
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=b
endif


if !&compatible
  set nocompatible
endif

let g:python_host_prog=$PYENV_ROOT.'/versions/neovim-2/bin/python'
let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim-3/bin/python'

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state('~/.cache/dein')
  let g:dein#cache_directory = $HOME . '/.cache/dein'
  let g:dein#auto_recache = 1

  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  let s:toml_dir  = $HOME . '/.cache/dein/rc'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" If you want to install not-installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" To enable filetype-plugins and indent scripts
" https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
filetype plugin indent on

" Enable syntax highlighting
syntax enable
