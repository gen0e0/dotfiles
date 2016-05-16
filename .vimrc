" シンタックスハイライトオン
syntax on
" デフォルトカラースキーマ
colorscheme default
" 256色カラースキーマに対応
set t_Co=256
" バックグラウンドカラー設定
set background=dark

" 互換性モードオフ
set nocompatible

" エンコーディング
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp

" バックアップオフ
set noswapfile
set nobackup
set nowritebackup

" ビープ音オフ
set vb t_vb=
set novisualbell

" 開いたファイルのディレクトリに自動移動
set autochdir
set browsedir=buffer 

" クリップボードを共有
set clipboard+=unnamed
set mouse=

" 折り返ししない
set nowrap
set nocursorline

" 右下に行・列番号表示
set ruler
" 左の行番号非表示
set nonumber

" 移動コマンド後に行頭に移動しない
set nostartofline

" タブ
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smarttab
set smartindent
set expandtab

" 対応する括弧をハイライト
set showmatch
set matchtime=3
set matchpairs& matchpairs+=<:>

" インクリメンタルサーチ　
set incsearch
set ignorecase
set smartcase

" バックスペースで色々削除できるようにする
set backspace=indent,eol,start

" ワイルドカー ド (|wildcards|) の展開時と
" ファイル／ディレクトリ名の補完時に無視される
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Vundle 
" How to install: 
" $ git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
if isdirectory(expand("~/.vim/bundle/Vundle.vim"))
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  filetype off 
  call vundle#begin()

  " インクリメンタルファイルサーチ
  Plugin 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_map = '<C-o>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }

  " Ruby on Rails
  Plugin 'tpope/vim-rails'

  " CoffeeScript syntax + autocompile
  Plugin 'kchmck/vim-coffee-script'

  " Go lang
  Plugin 'fatih/vim-go'

  " Python & Django
  Plugin 'vim-scripts/indentpython.vim'
  Plugin 'vim-scripts/django.vim'

  " Elixir
  Plugin 'elixir-lang/vim-elixir'

  " Color setting
  Plugin 'nanotech/jellybeans.vim'
  let g:jellybeans_background_color_256 = 0
  
  call vundle#end()
  filetype plugin indent on

  colorscheme jellybeans
endif

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4

" 行末までyank
nnoremap Y y$
" j連打でノーマルモードへ
inoremap jj <Esc>

" Emacs like keymapping
inoremap <C-f> <Right>
inoremap <C-b> <Left>
" inoremap <C-p> <Up>
" inoremap <C-n> <Down>
inoremap <C-a> ^
inoremap <C-e> $
inoremap <C-d> <Del>
inoremap <C-h> <BS>
inoremap <C-k> d$

" Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <C-n> :tabNext<CR>
nnoremap <C-p> :tabprevious<CR>
