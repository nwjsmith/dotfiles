# Silence greeting
set fish_greeting ""

set --export PATH \
  $HOME/.bin \
  /usr/local/sbin \
  /usr/local/bin \
  /usr/local/opt/coreutils/libexec/gnubin \
  $HOME/.cargo/bin \
  $PATH

set --export MANPATH /usr/local/coreutils/libexec/gnuman $MANPATH

# Colours
source $HOME/.config/fish/colours.fish

# Use Vim key bindings
set --global fish_key_bindings fish_vi_key_bindings
set --export EDITOR vim
set --export VISUAL $EDITOR

# Always a pain to type
alias be="bundle exec"

source /usr/local/opt/asdf/asdf.fish
