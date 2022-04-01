source "${HOME}/.zsh/brew-prefix.zsh"

PATH="${BREW_PREFIX}/bin:${BREW_PREFIX}/sbin:${PATH}"
export -U PATH

FPATH="${BREW_PREFIX}/share/zsh/site-functions:${FPATH}"

# Use GNU core utilities, which are more feature-rich than the BSD counterparts
# shipped by macOS
PATH="${BREW_PREFIX}/opt/coreutils/libexec/gnubin:${PATH}"
export -U PATH
MANPATH="${BREW_PREFIX}/opt/coreutils/libexec/gnuman:${MANPATH}"
export -U MANPATH

# `bat` is `cat` with syntax highlighting
export BAT_THEME="gruvbox-light"

# Cargo is Rust's package manager
PATH="${HOME}/.cargo/bin:${PATH}"
export -U PATH

# Use Antigen to manage ZSH plugins
source "${BREW_PREFIX}/share/antigen/antigen.zsh"

antigen bundle "mroth/evalcache"
antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "zsh-users/zsh-completions"
antigen bundle "zsh-users/zsh-syntax-highlighting"

antigen apply

# Use Neovim as the default editor and man pager
export VISUAL="nvim"
export EDITOR="${VISUAL}"
export MANPAGER="nvim +Man!"

# FZF is a fuzzy finder
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS='
  --color=bg+:#ebdbb2,bg:#fbf1c7,spinner:#b57614,hl:#b57614
  --color=fg:#3c3836,header:#bdae93,info:#076678,pointer:#076678
  --color=marker:#af3a03,fg+:#3c3836,prompt:#7c6f64,hl+:#b57614
'

# exa is fancy ls replacement
alias ll="exa -l"
alias la="exa -a"
alias lt="exa --tree"
alias lla="exa -la"

# Fiddle with the history defaults a bit
setopt hist_ignore_all_dups inc_append_history
export HISTSIZE=4096
export SAVEHIST=4096

# Use a global Brewfile to manage Homebrew packages
export HOMEBREW_BUNDLE_NO_LOCK=1
# I want to update Homebrew manually
export HOMEBREW_NO_AUTO_UPDATE=1

# Use Vi-like keybindings in ZSH, default to insert mode
bindkey -v

# Language runtime version managers are expensive to initialize. Use the
# `evalcache` plugin for ZSH to improve shell startup time.
_evalcache nodenv init -
_evalcache pyenv init --path
_evalcache pyenv init -
_evalcache rbenv init -
_evalcache direnv hook zsh

PATH="${HOME}/.local/bin:${PATH}"
export -U PATH

# Sometimes I run demos from the shell, and allowing comments is useful for
# descriptions.
setopt interactivecomments

# Use Pure for prompt
autoload -U promptinit && promptinit
prompt pure

# Manage Puppeteer's Chromium installation with Homebrew.
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=$(command -v chromium)

# Ruby should link against the OpenSSL installed via Homebrew
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${BREW_PREFIX}/opt/openssl@1.1"

# Use zoxide to move quickly around directories.
eval "$(zoxide init zsh)"

# ZSH completion is a productivity boost.
autoload -U compinit && compinit

# Integrate FZF with ZSH
source "/opt/homebrew/opt/fzf/shell/completion.zsh"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
