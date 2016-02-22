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

alias be="bundle exec"
alias clip="nc localhost 8377"

# Disable Rails' app preloading
export DISABLE_SPRING=1

# Better Python REPL
export PYTHONSTARTUP="${HOME}/.pythonstartup"

# Platform-specific bash configuration
if [ -f "${HOME}/.bashrc.platform" ]; then
  . "${HOME}/.bashrc.platform"
else
  echo "You forgot to link the platform-specific files, 'rcup -t \$PLATFORM'"
fi

# Keep private things in ~/.bashrc.local
if [ -f  "${HOME}/.bashrc.local" ]; then
  . "${HOME}/.bashrc.local"
fi
