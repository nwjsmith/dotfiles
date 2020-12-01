source "${HOME}/.zsh/brew-prefix.zsh"

export ZPLUG_HOME="${BREW_PREFIX}/opt/zplug"
source "${ZPLUG_HOME}/init.zsh"

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2

zplug load

for configuration in ${HOME}/.zsh/**/*.zsh; do
  source "${configuration}"
done
