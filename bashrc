# Path
export PATH="/usr/local/sbin:/usr/local/bin:${HOME}/.cargo/bin:${HOME}/.bin:${PATH}"

# Prompt
CYAN='\[\033[0;36m\]'
MAGENTA='\[\033[0;35m\]'
BLUE='\[\033[0;34m\]'
BROWN='\[\033[0;33m\]'
NO_COLOUR='\[\033[0m\]'
export PS1="${CYAN}\w${BLUE}\$(__git_ps1 ':(%s)')${NO_COLOUR} ${MAGENTA}λ${NO_COLOUR} "

# Do not overwrite files on stdout redirection
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt
PROMPT_DIRTRIM=2

# Case-insensitive file path completion
bind "set completion-ignore-case on"

# Display matches for ambiguous patterns at first tab press, not second
bind "set show-all-if-ambiguous on"

# Append history, don't overwrite
shopt -s histappend

# Save multi-line commands as one-liners
shopt -s cmdhist

# Record each command when issued
PROMPT_COMMAND="history -a"

# Large history
HISTSIZE=100000
HISTFILESIZE=${HISTSIZE}

# Avoid history duplicates
HISTCONTROL="erasedups:ignoreboth"

# Skip recording some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Correct spelling in tab-completion
shopt -s direxpand dirspell

# Correct spelling in cd
shopt -s cdspell

# Use vim
export VISUAL="vim"
export EDITOR="${VISUAL}"
set -o vi

# Always a pain to type
alias be="bundle exec"

# Calculate once
BREW_PREFIX="$(brew --prefix)"

# Autocomplete Bash commands
if [ -f ${BREW_PREFIX}/etc/bash_completion ]; then
  . ${BREW_PREFIX}/etc/bash_completion
fi

if type brew 2 &>/dev/null; then
  for completion_file in ${BREW_PREFIX}/etc/bash_completion.d/*; do
    source "${completion_file}"
  done
fi

complete -C /usr/local/bin/vault vault

# Use the GNU versions of everything
export PATH="${BREW_PREFIX}/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="${BREW_PREFIX}/opt/coreutils/libexec/gnuman:${MANPATH}"

# Heroku toolbelt
export PATH="${BREW_PREFIX}/opt/heroku/bin:${PATH}"

# asdf-vm for managing language versions
. "${BREW_PREFIX}/opt/asdf/asdf.sh"

# Trust safe repositories
export PATH=".git/safe/../../bin:${PATH}"

# Keep private things in ~/.bashrc.local
if [ -f "${HOME}/.bashrc.local" ]; then
  source "${HOME}/.bashrc.local"
fi
