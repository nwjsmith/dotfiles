# dotfiles

These are my dotfiles. They work on both Intel and ARM Macs.

## Pre-requisites

macOS with Homebrew installed.

On ARM, you'll need to install rustup along with a beta Rust toolchain, then:

```
$ cargo install starship --git https://github.com/starship/starship.git
$ cargo install git-absorb fd-find ripgrep topgrade
```

We might be able to skip this or the step above later, but you'll need to edit
the Rust formula in Homebrew to include ninja.

```
depends_on "ninja" => :build
```

Download the Zulu JDK for macOS/ARM64 and then link it into Homebrew:

```
$ ln -s /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home /opt/homebrew/opt/openjdk
```

## Installation

```
$ git clone https://github.com/nwjsmith/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ EXCLUDES="README.md" rcup -t $(arch)
```

I highly recommend creating a `~/.rcrc` file with at least
`EXCLUDES="README.md"` and `TAGS="$(arch)"` in it.
