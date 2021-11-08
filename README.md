# dotfiles

These are my dotfiles. They work on both Intel and ARM Macs.

## Pre-requisites

macOS with Homebrew installed.

## Installation

```
$ brew install rcm
$ git clone https://github.com/nwjsmith/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ EXCLUDES="README.md" rcup -t $(arch)
```

I highly recommend creating a `~/.rcrc` file with at least
`EXCLUDES="README.md"` and `TAGS="$(arch)"` in it.

## etc.

### `sudo` and TouchID

To use TouchID or your Apple Watch with `sudo`, add the following lines to `/etc/pam.d/sudo`:

**ARM**

```
auth       optional       /opt/homebrew/lib/pam/pam_reattach.so
auth       sufficient     pam_tid.so
```

**Intel**

```
auth       optional       /usr/local/lib/pam/pam_reattach.so
auth       sufficient     pam_tid.so
```

### Slack theme

```
#fbf1c7,#ebdbb2,#d79921,#665c54,#d5c4a1,#3c3836,#98971a,#9d0006,#ebdbb2,#2828282
```

### Java

```
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

[gruvbox-iterm]: https://github.com/gruvbox-community/gruvbox-contrib/tree/master/iterm2
