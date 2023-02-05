# dotfiles

These are my dotfiles. They work on macOS.

## Pre-requisites

macOS, Homebrew and Nix installed with Flakes enabled.

    $ sh <(curl -L https://nixos.org/nix/install) \
      --nix-extra-conf-file <(echo "experimental-features = nix-command flakes")

## Install Nix

Install Nix using Determinate System's installer

Ensure the `/run` directory exists.

    $ printf 'run\tprivate/var/run\n' | sudo tee -a /etc/synthetic.conf
    $ /System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t

## Installation

    $ git clone https://github.com/nwjsmith/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ nix build .#darwinConfigurations.workbook.system
    $ ./result/sw/bin/darwin-rebuild switch --flake .
