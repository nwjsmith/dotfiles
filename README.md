# dotfiles

These are my dotfiles. They work on macOS.

## Pre-requisites

macOS with Homebrew and Nix installed with Flakes enabled.

## Installation

  $ git clone https://github.com/nwjsmith/dotfiles ~/.dotfiles
  $ nix build ~/.dotfiles\#darwinConfigurations.$(hostname).system
  $ ./result/sw/bin/darwin-rebuild switch --flake .

## etc.

### Slack theme

  #fbf1c7,#ebdbb2,#d79921,#665c54,#d5c4a1,#3c3836,#98971a,#9d0006,#ebdbb2,#2828282

### Emacs

Managing Emacs and DOOM through Nix is a huge pain in the ass, so it's all done
via Homebrew still. After running an install, re-install emacs to pick up
native comp and a better icon.

  $ brew install emacs-plus --with-native-comp --with-modern-doom-icon

Getting Emacs built through Nix is a big TODO on my part, but this works for
now.
