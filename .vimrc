set nocompatible

set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp

" screen上で256色カラースキーマに対応
" if $TERM == 'screen'
 set t_Co=256
" endif

syntax on
colorscheme default

set nobackup
set noswapfile

" 開いたファイルのディレクトリに自動移動
set autochdir
set browsedir=buffer 

" クリップボードを共有
set clipboard+=unnamed
set mouse=

" 折り返ししない
set nowrap
set nocursorline

" タブ
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smarttab
set smartindent
set expandtab

set showmatch
set incsearch
set ignorecase
set smartcase
set nonumber

set backspace=indent,eol,start

" Vundle 
" to install: 
" $ git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
if isdirectory(expand("~/.vim/bundle/Vundle.vim"))
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  filetype off 
  call vundle#begin()

  " インクリメンタルファイルサーチ
  Plugin 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'

  " Ruby on Rails
  Plugin 'tpope/vim-rails'

  " CoffeeScript syntax + autocompile
  Plugin 'kchmck/vim-coffee-script'

  " Go lang
  Plugin 'jnwhiteh/vim-golang'

  " Elixir
  Plugin 'elixir-lang/vim-elixir'

  " Color setting
  Plugin 'nanotech/jellybeans.vim'
  let g:jellybeans_background_color_256 = 0
  
  call vundle#end()
  filetype plugin indent on

  colorscheme jellybeans
endif


" 検索結果のハイライトをESC連打で消す
noremap <Esc><Esc> :nohlsearch<CR><Esc>

" 行末までyank
nnoremap Y y$
