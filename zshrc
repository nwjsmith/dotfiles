export PATH="/usr/local/sbin:/usr/local/bin:${HOME}/.cargo/bin:${HOME}/.bin:${PATH}"

# Large history
export HISTSIZE=100000
export HISTFILESIZE=${HISTSIZE}
setopt append_history
setopt extended_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups

# Prompt
eval "$(starship init zsh)"

# Vi bindings
bindkey -v
export VISUAL="vim"
export EDITOR="${VISUAL}"

# Trust safe repositories
export PATH=".git/safe/../../bin:${PATH}"

if [ -f "${HOME}/.zshrc.platform" ]; then
  source "${HOME}/.zshrc.platform"
else
  echo "You forgot to link the platform-specific files, 'rcup -t \$PLATFORM'"
fi
