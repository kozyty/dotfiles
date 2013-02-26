# .zshrc

# BindKey
bindkey -e

## Alias
alias r='rails'
alias ll='ls -lah'
alias rm='rm -i'
alias cp='cp -i'
alias vi='vim'
alias wget='wget --no-check-certificate'
alias grep='grep -n --color'
alias vim='/usr/local/vim-7.3/bin/vim'
#alias vim='~/bin/vim'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH

PROMPT="%{%}%n@%m%{%}${WINDOW:+[$WINDOW]} %{%}%~ %{%}%* %{%}%#%{%} "
PROMPT="%{%}%n@%m%{%}${WINDOW:+[$WINDOW]} %{%}%(4~,%-1~/.../%2~,%~)%{%} %# "
RPROMPT='%{%}%h %{%}%T%{%}'

# git branch
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' formats '(%s)-[%b]'
# zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
# precmd () {
   # psvar=()
   # LANG=en_US.UTF-8 vcs_info
   # [[ -n "$vcs_info_msg_0_" ]]  psvar[1]="$vcs_info_msg_0_"
# }
# RPROMPT="%1(v|%F{green}%1v%f|)"
# source ~/.zsh/git-completion.bash
#autoload bashcompinit
#bashcompinit
#source ~/.zsh/git-completion.bash
#fpath=(~/workspace/zsh-completions $fpath)

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

#rvm
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

autoload -U compinit
compinit -u

setopt auto_param_keys
setopt brace_ccl
setopt complete_in_word
setopt complete_aliases
setopt extended_glob
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

# sudoでも補完の対象
zstyle ':completion:*:sudo:*' command-path ~/bin /opt/local/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /b

# history-search-end
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
