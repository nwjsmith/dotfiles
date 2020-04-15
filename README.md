# dotfiles

These are my dotfiles.

## Installation

```
$ git clone https://github.com/nwjsmith/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ RCRC="rcrc" rcup -t $PLATFORM
```

Where `$PLATFORM` should be one of `macos` or `linux`. Subsequent runs of `rcup` should forego setting `RCRC`.

## jEnv initialization

jEnv needs a bit more work. After everything is installed, run the following to get jEnv to see all the JDKs.

```
$ find /Library/Java/JavaVirtualMachines -type d -name 'Home' -exec jenv add {} \;
```
