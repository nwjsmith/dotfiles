export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

[[ $- == *i* ]] && source "${BREW_PREFIX}/opt/fzf/shell/completion.zsh" 2> /dev/null

source "${BREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
