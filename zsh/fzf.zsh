export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

export FZF_DEFAULT_OPTS='
  --color=bg+:#ebdbb2,bg:#fbf1c7,spinner:#b57614,hl:#b57614
  --color=fg:#3c3836,header:#bdae93,info:#076678,pointer:#076678
  --color=marker:#af3a03,fg+:#3c3836,prompt:#7c6f64,hl+:#b57614
'

[[ $- == *i* ]] && source "${BREW_PREFIX}/opt/fzf/shell/completion.zsh" 2> /dev/null

source "${BREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
