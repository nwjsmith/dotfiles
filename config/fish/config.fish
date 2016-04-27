# Homebrew
set --export PATH "/usr/local/sbin" $PATH
set --export PATH "/usr/local/bin" $PATH

# Rust
set --export PATH $HOME/.cargo/bin $PATH

# Use vim
fish_vi_mode
set --export EDITOR "vim"
set --export VISUAL $EDITOR

# Disable Rails' app preloading
set --export DISABLE_SPRING 1

# Better Python REPL
set --export PYTHONSTARTUP $HOME/.pythonstartup

# Use chruby for switching Rubies
source (brew --prefix chruby-fish)/share/chruby/chruby.fish
source (brew --prefix chruby-fish)/share/chruby/auto.fish

# Heroku toolbelt
set --export PATH (brew --prefix heroku)/bin $PATH

# Java
set --export JAVA_HOME (/usr/libexec/java_home)

# Go lang
set --export GOPATH (brew --prefix)/lib/go

# Use the GNU versions of everything
set --export PATH (brew --prefix coreutils)/libexec/gnubin $PATH
set --export MANPATH (brew --prefix coreutils)/libexec/gnuman $MANPATH

# Always a pain to type
alias be="bundle exec"

# Keep up-to-date
alias brewup="brew update and brew upgrade --all and brew cleanup"

# Open from shell
alias fopen="open -a Finder"

# Copy to clipboard by piping to the `clip` alias
alias clip="nc localhost 8377"
