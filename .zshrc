# .zshrc

# BindKey
bindkey -e

## Alias
alias r='rails'
alias ll='ls -lah'
alias rm='rm -i'
alias cp='cp -i'
alias wget='wget --no-check-certificate'
alias grep='grep --color'
#alias vim='/usr/local/vim/bin/vim'
alias vi='vim'
alias git-delete-merged-branches="git branch --merged | grep -v '*' | xargs -I % git branch -d %"

alias php="/Applications/XAMPP/bin/php"
alias pear="/Applications/XAMPP/bin/pear"
alias pecl="/Applications/XAMPP/bin/pecl"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH
export PATH=/Applications/Xcode6-Beta2.app//Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH

## rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

## ndenv
# export PATH=$HOME/.ndenv/bin:$PATH
# eval "$(ndenv init - zsh)"

## direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

## npm
export PATH="/usr/local/share/npm/bin:$PATH"

## nvm
# [[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
# nvm use default
# npm_dir=${NVM_PATH}_modules
# export NODE_PATH=$npm_dir
# source ~/.nvm/nvm.sh

PROMPT="%{%}%n@%m%{%}${WINDOW:+[$WINDOW]} %{%}%~ %{%}%* %{%}%#%{%} "
PROMPT="%{%}%n@%m%{%}${WINDOW:+[$WINDOW]} %{%}%(4~,%-1~/.../%2~,%~)%{%} %# "
RPROMPT='%{%}%h %{%}%T%{%}'

_set_env_git_current_branch() {
GIT_CURRENT_BRANCH=$( git branch 2> /dev/null | grep '^\*' | cut -b 3- )
}

_update_rprompt () {
if [ "`git ls-files 2>/dev/null`" ]; then
RPROMPT="[$GIT_CURRENT_BRANCH]"
else
RPROMPT=
fi
}

precmd() {
_set_env_git_current_branch
_update_rprompt
}

chpwd() {
_set_env_git_current_branch
_update_rprompt
}

if [ -e ~/.zsh/completions ]; then
  fpath=(~/.zsh/completions $fpath)
fi

autoload -U compinit
compinit -u

# antigen
# source ~/.zshrc.antigen

# zsh オプション
setopt complete_aliases
setopt extended_history
setopt nolistbeep
setopt menu_complete
setopt rm_star_silent
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt no_tify
setopt share_history
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed

# 補完に関するオプション
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる

setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示

setopt print_eight_bit  #日本語ファイル名等8ビットを通す
setopt extended_glob  # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt globdots # 明確なドットの指定なしで.から始まるファイルをマッチ

# 範囲指定できるようにする
# 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
setopt brace_ccl

# manの補完をセクション番号別に表示させる
zstyle ':completion:*:manuals' separate-sections true

# 変数の添字を補完する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

bindkey "^I" menu-complete   # 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)

# 色の定義
local DEFAULT=$'%{^[[m%}'$
local RED=$'%{^[[1;31m%}'$
local GREEN=$'%{^[[1;32m%}'$
local YELLOW=$'%{^[[1;33m%}'$
local BLUE=$'%{^[[1;34m%}'$
local PURPLE=$'%{^[[1;35m%}'$
local LIGHT_BLUE=$'%{^[[1;36m%}'$
local WHITE=$'%{^[[1;37m%}'$

# apt-getとかdpkgコマンドをキャッシュを使って速くする
# zstyle ':completion:*' use-cache true

# ディレクトリを切り替える時の色々な補完スタイル
#あらかじめcdpathを適当に設定しておく
cdpath=(~ ~/workspace/ /var/nanapi/apps/)

# カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補に出す
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
#cd は親ディレクトリからカレントディレクトリを選択しないので表示させないようにする (例: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# オブジェクトファイルとか中間ファイルとかはfileとして補完させない
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'


# -------------------------
# zsh-completion
# -------------------------

# zsh-completions
fpath=(~/workspace/zsh-completions/src $fpath)

# 補完関数の表示を強化する
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
# zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
# zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
# zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# sudoでも補完の対象
zstyle ':completion:*:sudo:*' command-path ~/bin /opt/local/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /b

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# セパレータを設定する
# zstyle ':completion:*' list-separator '-->'

# hub.zsh_completion
#source ~/workspace/hub/etc/hub.zsh_completion

# 名前で色を付けるようにする
autoload colors
colors

# LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# -------------------------
# peco
# -------------------------
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# -------------------------
# history-search-end
# -------------------------
# autoload history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "^P" history-beginning-search-backward-end
# bindkey "^N" history-beginning-search-forward-end

# enter de ls git-status
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls # ls_abbrev ←オススメ
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter

# mkdir + cd
function mkcd() {
  if [[ -d $1 ]]; then
    echo "It already exsits! Cd to the directory."
    cd $1
  else
    echo "Created the directory and cd to it."
    mkdir -p $1 && cd $1
  fi
}

export PATH=/opt/chefdk/bin:$PATH

if [ -x "`which go`" ]; then
	export GOENV_ROOT=$HOME/.goenv
	export PATH=$GOENV_ROOT/bin:$PATH
  export GOPATH=$HOME/go
  PATH=$PATH:$GOPATH/bin
fi

function peco-ghq () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ghq
bindkey '^]' peco-ghq

# The next line updates PATH for the Google Cloud SDK.
# source '/Users/taiyo.kojima/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
# source '/Users/taiyo.kojima/google-cloud-sdk/completion.zsh.inc'
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
