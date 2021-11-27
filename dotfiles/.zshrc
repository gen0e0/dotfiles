# カラー設定読み込み
autoload -Uz colors; colors
# 補完設定読み込み
autoload -Uz compinit; compinit

# cd省略
setopt auto_cd
# cdでpushdする。
setopt auto_pushd
# 同じディレクトリを重複してpushしない。
setopt pushd_ignore_dups

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# ビープ音抑制
setopt no_beep # このオプションはzsh 5.0.2に存在しなかったが一応設定しておく
setopt no_listbeep

# 履歴系
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
# 複数のzshを同時に使う時などhistoryファイルに上書きせず追加する
setopt append_history
# 直前の重複するコマンドをヒストリに追加しない
setopt hist_ignore_dups
# 先頭に空白のあるコマンドをヒストリに追加しない
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify
# シェルのプロセスごとに履歴を共有
setopt share_history

# プロンプトの設定
# 文字属性を変えるエスケープシーケンスには%{%}を必ず付ける事。省略すると文字の幅寄せがずれる
PROMPT="%{${fg[green]}%}%m%{${fg[white]}%}:%{${fg[blue]}%}%~%{${fg[white]}%}%(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[white]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT=""
# SSH, SCREEN内にいるときは右端に注釈を出す
[ -n "${WINDOW}" ] && RPROMPT="%{${fg[cyan]}%}[screen]%{${reset_color}%}${RPROMPT}"
[ -n "${SSH_CONNECTION}" ] && RPROMPT="%{${fg[cyan]}%}[ssh]%{${reset_color}%}${RPROMPT}"

# ターミナルの色設定
# http://news.mynavi.jp/column/zsh/009/index.html
# a: 黒 b: 赤 c: 緑 d: 茶 e: 青 f: マゼンタ g: シアン h: 白 A: 黒(太字) B: 赤(太字) C: 緑(太字) 
# D: 茶(太字) E: 青(太字) F: マゼンタ(太字) G: シアン(太字) H: 白(太字) x: デフォルト色
case "${TERM}" in 
  kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    export LSCOLORS=exgxbxdxcxegedabagacad
    export LS_COLORS='di=34:ln=36:so=31:pi=33:ex=32:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=36' 'so=31' 'ex=32' 'bd=46;34' 'cd=43;34'
  ;;
esac

# 環境変数
export LESS='-R'
export CLICOLOR=1
export CLICOLOR_FORCE=1 # lsを端末以外へ出力する場合(lessへ渡す時など)も色付きにする

# 各マシン固有の環境変数は.envに書く
if [ -f $HOME/.env ]; then
  source $HOME/.env
fi

# 各マシン固有の前処理は.profileに書く
if [ -f $HOME/.profile ]; then
  source $HOME/.profile
fi

# エイリアス設定ファイルを読み込む
if [ -f $HOME/.alias ]; then
  source $HOME/.alias
fi
