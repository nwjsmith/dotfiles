# Calculate once
export BREW_PREFIX="$(brew --prefix)"

# Plugins
source "${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${BREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Completions
FPATH="${BREW_PREFIX}/share/zsh-completions:$FPATH"
autoload -Uz compinit
compinit

for configuration in ${HOME}/.zsh/**/*.zsh; do
  source "${configuration}"
done
