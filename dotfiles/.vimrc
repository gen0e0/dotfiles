" Basics
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" シンタックスハイライト
syntax on
" デフォルトカラースキーマ
colorscheme default
" 256色カラースキーマに対応
set t_Co=256
" バックグラウンドカラー設定
set background=dark

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
" 左の行番号表示
set number

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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.meta,.git


" Vundle 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" How to install: 
" $ git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
if isdirectory(expand("~/.vim/bundle/Vundle.vim"))
  set nocompatible
  filetype off 
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " インクリメンタルファイルサーチ
    Plugin 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_map = '<C-o>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll|meta|tmp)$',
      \ }

    " Directory Tree 
    Plugin 'scrooloose/nerdtree'
    let NERDTreeIgnore = [
    \     '\.git$',
    \     '\.pyc$',
    \     '\.meta$'
    \   ]
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
      map t :NERDTree<CR>
    endif

    " Ruby on Rails
    Plugin 'tpope/vim-rails'

    " Go lang
    Plugin 'fatih/vim-go'

    " Python & Django
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'vim-scripts/django.vim'

    " Elixir
    Plugin 'elixir-lang/vim-elixir'

    " Javascript
    Plugin 'pangloss/vim-javascript'

    " React.js
    Plugin 'mxw/vim-jsx'

    " Vue.js
    Plugin 'posva/vim-vue'
    
    " CoffeeScript + autocompile
    Plugin 'kchmck/vim-coffee-script'

    " Color scheme
    Plugin 'nanotech/jellybeans.vim'
    let g:jellybeans_overrides = {
    \     'Background': { 'guibg': '000000' },
    \     'Comment': { 'guifg': '000000' },
    \   }

  call vundle#end()
  filetype plugin indent on

  " Color scheme
  " この設定は filetype plugin indent on の後に書かなくてはならない
  if isdirectory(expand("~/.vim/bundle/jellybeans.vim"))
    colorscheme jellybeans
  endif
endif


" Filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" タブストップの設定
autocmd FileType ruby       setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType php        setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4 tabstop=4


" Key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 行末までyank
nnoremap Y y$
" j連打でノーマルモードへ
inoremap jj <Esc>

" Emacsっぽい動き
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>

" Tabs
nnoremap <C-t><C-t> :tabnew<CR>
nnoremap <C-t><C-w> :tabclose<CR>
nnoremap <C-t><C-n> :tabnext<CR>
nnoremap <C-t><C-p> :tabprevious<CR>

" Buffer
nnoremap <silent> gp :bprevious<CR>
nnoremap <silent> gn :bnext<CR>

" 以下のマッピングはVundleセクションの中にある
" map t :NERDTree<CR>
