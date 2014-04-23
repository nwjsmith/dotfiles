# All brew everything
export PATH="/usr/local/sbin:/usr/local/bin:${PATH}"

if [[ -z $TMUX ]]; then
  if (tmux has-session); then
    tmux -u attach -d && exit
  else
    tmux -2 -u && exit
  fi
fi

# Use bash completion provided by homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Prompt
CYAN='\[\033[0;36m\]'
MAGENTA='\[\033[0;35m\]'
BLUE='\[\033[0;34m\]'
NO_COLOR='\[\033[0m\]'
export PS1="${CYAN}\w${BLUE}\$(__git_ps1 ':(%s)')${NO_COLOR}\n${MAGENTA}λ${NO_COLOR} "

# Append history
shopt -s histappend
# Avoid history duplicates
export HISTCONTROL=ignoredups:erasedups
# Large history
export HISTSIZE=100000
export HISTFILESIZE=${HISTSIZE}
# Append history after each command, clear and reload history
export PROMPT_COMMAND="history -a; history -c; history -r ${PROMPT_COMMAND}"

# Java
export JAVA_HOME="$(/usr/libexec/java_home)"

# Android
export ANDROID_HOME="$(brew --prefix android-sdk)"

# Use vim
export EDITOR="vim"
set -o vi

# Colours for ls
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

# Go lang
export PATH="$(brew --prefix go)/bin:${PATH}"
export GOPATH="/usr/local/lib/go"
export PATH="${GOPATH}/bin:${PATH}"

# Use the GNU versions of everything
export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

# Ruby ruby ruby
export RBENV_ROOT="$(brew --prefix)/var/rbenv"
eval "$(rbenv init -)"
alias be="bundle exec"

# Node
export PATH="/usr/local/share/npm/bin:${PATH}"

# Curl CA certificates
export SSL_CERT_FILE="/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt"

# Keep up-to-date
alias brewup="brew update && brew cleanup"

# Exit/enter out of tmux
alias demux="tmux kill-server && exec env TMUX='nope' ${SHELL}"
alias remux="exec env TMUX='' ${SHELL}"
