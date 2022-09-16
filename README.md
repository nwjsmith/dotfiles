# dotfiles

These are my dotfiles. They work on macOS.

## Pre-requisites

macOS, Homebrew and Nix installed with Flakes enabled.

    $ sh <(curl -L https://nixos.org/nix/install) \
      --nix-extra-conf-file <(echo "experimental-features = nix-command flakes")

## Installation

    $ git clone https://github.com/nwjsmith/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ nix build .#darwinConfigurations.$(hostname).system
    $ ./result/sw/bin/darwin-rebuild switch --flake .

## etc.

### Slack theme

    #282a36,#44475a,#44475a,#8be9fd,#6272a4,#ffffff,#50fa7b,#ff5555
