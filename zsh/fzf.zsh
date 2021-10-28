export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

export FZF_DEFAULT_OPTS='
  --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
  --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
  --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
  --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b
'

[[ $- == *i* ]] && source "${BREW_PREFIX}/opt/fzf/shell/completion.zsh" 2> /dev/null

source "${BREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
