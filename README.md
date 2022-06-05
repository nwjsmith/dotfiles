# dotfiles

These are my dotfiles. They work on macOS.

## Pre-requisites

macOS, Homebrew and Nix installed with Flakes enabled.

  $ sh <(curl -L https://nixos.org/nix/install) --nix-extra-conf-file <(echo "experimental-features = nix-command flakes")

## Installation

  $ git clone https://github.com/nwjsmith/dotfiles ~/.dotfiles
  $ nix build ~/.dotfiles\#darwinConfigurations.$(hostname).system
  $ ./result/sw/bin/darwin-rebuild switch --flake .

## etc.

### Slack theme

  #fbf1c7,#ebdbb2,#d79921,#665c54,#d5c4a1,#3c3836,#98971a,#9d0006,#ebdbb2,#2828282
