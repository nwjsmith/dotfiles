source "${HOME}/.zsh/brew-prefix.zsh"

PATH="${BREW_PREFIX}/bin:${BREW_PREFIX}/sbin:${PATH}"
export -U PATH

FPATH="${BREW_PREFIX}/share/zsh/site-functions:${FPATH}"

source "${BREW_PREFIX}/share/antigen/antigen.zsh"

antigen bundle "mroth/evalcache"
antigen bundle "rupa/z"
antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "zsh-users/zsh-completions"
antigen bundle "zsh-users/zsh-syntax-highlighting"
antigen bundle "zsh-users/zsh-history-substring-search"

antigen apply

for configuration in ${HOME}/.zsh/**/*.zsh; do
  source "${configuration}"
done
