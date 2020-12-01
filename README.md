# dotfiles

These are my dotfiles.

## Installation

```
$ git clone https://github.com/nwjsmith/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ EXCLUDES="README.md" rcup -t $(arch)
```

I highly recommend creating a `~/.rcrc` file with at least
`EXCLUDES="README.md"` and `TAGS="$(arch)"` in it.
