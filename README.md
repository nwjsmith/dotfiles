# dotfiles

These are my dotfiles. They work on macOS.

## Pre-requisites

macOS, Homebrew and Nix installed with Flakes enabled.

    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    $ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

## Installation

    $ git clone https://github.com/nwjsmith/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ nix build .#darwinConfigurations.workbook.system
    $ ./result/sw/bin/darwin-rebuild switch --flake .
