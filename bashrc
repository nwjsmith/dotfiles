# Path
export PATH="/usr/local/sbin:/usr/local/bin:${PATH}"

# Prompt
CYAN='\[\033[0;36m\]'
MAGENTA='\[\033[0;35m\]'
BLUE='\[\033[0;34m\]'
BROWN='\[\033[0;33m\]'
NO_COLOR='\[\033[0m\]'
export PS1="${BROWN}[\h] ${CYAN}\w${BLUE}\$(__git_ps1 ':(%s)')${NO_COLOR}\n${MAGENTA}λ${NO_COLOR} "

# Append history
shopt -s histappend
# Avoid history duplicates
export HISTCONTROL=ignoredups:erasedups
# Large history
export HISTSIZE=100000
export HISTFILESIZE=${HISTSIZE}

# Use vim
export VISUAL="vim"
export EDITOR=$VISUAL
set -o vi

export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--colour"
alias ls="ls -CF --color=auto"

# Colors and width for man pages
export MANWIDTH=${MANWIDTH:-80}
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

alias be="bundle exec"

# Disable Rails' app preloading
export DISABLE_SPRING=1

# Keep private things in ~/.bashrc.local
if [ -f $HOME/.bashrc.local ]; then
  . $HOME/.bashrc.local
fi
