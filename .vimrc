set nocompatible

set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp

" 256色カラースキーマに対応
set t_Co=256
set background=dark

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

if filereadable(expand("~/.vim/bundle/neobundle.vim/autoload/neobundle.vim"))
  " パッケージマネージャ
  " neobundle.vim (Shougo/neobundle.vim)
  " 初回は自分でインストールすること
  " $ git submodule init
  " $ git submodule update
  filetype off 
  if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim
      call neobundle#rc(expand('~/.vim/bundle'))
  endif
  NeoBundle 'Shougo/neobundle.vim'

  " 非同期通信
  " 環境に合わせてコンパイルすること
  " 例: MacOSXの場合
  " $ cd .vim/bundle/vimproc
  " $ make -f make_mac.mak
  NeoBundle 'Shougo/vimproc', {
  \   'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \   }
  \ }

  " 直感的なUIを提供するてきな
  NeoBundle 'Shougo/unite.vim'
  " ウィンドウを分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
  au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
  " " ウィンドウを縦に分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
  au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
  " ESCキーを2回押すと終了する
  au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

  " Git操作 
  NeoBundle 'tpope/vim-fugitive'
  nnoremap <silent> <Space>gb :Gblame<CR>
  nnoremap <silent> <Space>gd :Gdiff<CR>
  nnoremap <silent> <Space>gs :Gstatus<CR>

  " ファイラ
  " http://qiita.com/hide/items/b0087bc0bbc36d0f91fb
  " NeoBundle 'Shougo/vimfiler'
  " let g:vimfiler_as_default_explorer = 1

  " 補完
  " NeoBundle 'Shougo/neocomplcache'
  " NeoBundle 'Shougo/neosnippet'
  " NeoBundle 'taichouchou2/vim-rsense'
  " NeoBundle 'Shougo/neocomplcache-rsense'
  " if filereadable(expand('~/.vim/neocomplcacherc.vim'))
  "   source ~/.vim/neocomplcacherc.vim
  " endif

  " ドキュメント
  NeoBundle 'thinca/vim-ref'
  NeoBundle 'taka84u9/vim-ref-ri'

  " バイナリエディタ
  " Pythonインターフェイスが必要 ex. # port install vim +python27
  " :Vinarise
  " NeoBundle 'Shougo/vinarise'

  " Ruby on Rails
  NeoBundle 'tpope/vim-rails'

  " CoffeeScript syntax + autocompile
  NeoBundle 'kchmck/vim-coffee-script'

  " Go language
  NeoBundle 'jnwhiteh/vim-golang'

  " *.hbs
  NeoBundle 'juvenn/mustache.vim'

  " Color scheme
  "NeoBundle 'w0ng/vim-hybrid'
  NeoBundle 'nanotech/jellybeans.vim'
  let g:jellybeans_background_color_256 = 0
  syntax on
  colorscheme jellybeans

  " Web browser
  NeoBundle 'yuratomo/w3m.vim'
  let g:w3m#homepage = "http://www.google.co.jp/"
  let g:w3m#lang = 'en_US'

  " NeoBundleがfiletypeをoffにするため
  filetype plugin indent on

else
  " NeoBundleがインストールされていない時
  syntax on
  colorscheme default
  filetype plugin indent on
end

