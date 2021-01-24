# vim: set ft=ruby

tap "d12frosted/emacs-plus"
tap "homebrew/bundle"
tap "homebrew/core"
tap "homebrew/cask"
tap "homebrew/cask-drivers"
tap "homebrew/cask-fonts"
tap "homebrew/services"

cask_args appdir: "/Applications"

def load_brewfile(brewfile)
  path = File.expand_path(brewfile, __dir__)
  instance_eval(File.read(brewfile), path) if File.exist?(brewfile)
end

load_brewfile ".Brewfile.arch"
load_brewfile ".Brewfile.host"

brew "adr-tools"
brew "asdf"
brew "fd"
brew "git"
brew "git-absorb"
brew "gnupg"
brew "jq"
brew "multimarkdown"
brew "oniguruma"
brew "openssl@1.1"
brew "pinentry-mac"
brew "python@3.9"
brew "rcm"
brew "readline"
brew "ripgrep"
brew "reattach-to-user-namespace"
brew "rlwrap"
brew "rust"
brew "sqlite"
brew "starship"
brew "tmux"
brew "tree"
brew "vim"
brew "youtube-dl"
brew "zplug"
brew "zsh"

cask "1password"
cask "bartender"
cask "camo-studio"
cask "cleanshot"
cask "font-jetbrains-mono"
cask "iterm2"
cask "hey"
cask "mochi"
cask "slack"
cask "sonos"
cask "spotify"
