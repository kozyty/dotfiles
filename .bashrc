# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

LANG=ja_JP.UTF-8
# LANG=en_US.utf8

### PATH
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# OS別環境設定
if [ `uname` = "Linux" ]; then
  # for Linux
  PATH=$PATH:/usr/local/ctags/bin
  PATH=$PATH:/usr/local/tig-1.0/bin

  alias vim='/usr/local/vim/bin/vim'

elif [ `uname` = "Darwin" ]; then
  # for Mac
  PATH=$PATH:/usr/local/ctags/bin
  PATH=$PATH:/usr/local/tig-1.0/bin

fi

export PATH

export TERM=xterm-256color

### Alias
alias ll='ls -lah'
alias rm='rm -i'
alias cp='cp -i'
alias vi='vim'
alias wget='wget --no-check-certificate'
alias grep='grep -n --color'

# -S オプションで折り返さなくする
# エディタはvim
alias mysql="EDITOR=\"/usr/local/vim/bin/vim -c ':set ft=sql'\" mysql --auto-rehash --pager='less -S'"

### Git
# gitのブランチの情報を婦論プロトに表示させておく
# export PS1="[\u@\h \W]\$(__git_ps1) \$ "
export PS1='[\u@\h \W$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")]\$ '

### SSH
alias ssh="ssh -2 -o ServerAliveInterval=60"

export NVM_DIR="/Users/taiyo.kojima/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
