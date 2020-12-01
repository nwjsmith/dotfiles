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

# Calculate once
BREW_PREFIX="$(brew --prefix)"

# Use the GNU versions of everything
export PATH="${BREW_PREFIX}/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="${BREW_PREFIX}/opt/coreutils/libexec/gnuman:${MANPATH}"

# Heroku toolbelt
export PATH="${BREW_PREFIX}/opt/heroku/bin:${PATH}"

# asdf-vm for managing language versions
. "${BREW_PREFIX}/opt/asdf/asdf.sh"

# Plugins
source "${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${BREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Completions
FPATH="${BREW_PREFIX}/share/zsh-completions:$FPATH"
autoload -Uz compinit
compinit

