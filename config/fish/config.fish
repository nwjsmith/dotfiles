# Silence greeting
set fish_greeting ""

# Homebrew
set --export PATH "/usr/local/bin" $PATH

# Colours
source $HOME/.config/fish/colours.fish

# Rust
set --export PATH $HOME/.cargo/bin $PATH

# Use vim
set --global fish_key_bindings fish_vi_key_bindings
set --export EDITOR "vim"
set --export VISUAL $EDITOR

# Better Python REPL
set --export PYTHONSTARTUP $HOME/.pythonstartup

# Use chruby for switching Rubies
source (brew --prefix chruby-fish)/share/chruby/chruby.fish
source (brew --prefix chruby-fish)/share/chruby/auto.fish

# Heroku toolbelt
set --export PATH (brew --prefix heroku)/bin $PATH

# Java
set --export JAVA_HOME (/usr/libexec/java_home)

# Android
set --export ANDROID_HOME (brew --prefix android-sdk)

# Go lang
set --export GOPATH (brew --prefix)/lib/go:(realpath ~/Code/go)
set --export PATH (brew --prefix)/lib/go/bin $PATH

# Use the GNU versions of everything
set --export PATH (brew --prefix coreutils)/libexec/gnubin $PATH

# Always a pain to type
alias be="bundle exec"

# Open from shell
alias fopen="open -a Finder"
