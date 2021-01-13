# vim: set ft=ruby

tap "d12frosted/emacs-plus"
tap "homebrew/bundle"
tap "homebrew/core"
tap "homebrew/cask"
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
brew "git"
brew "gnupg"
brew "jq"
brew "openssl@1.1"
brew "python@3.9"
brew "readline"
brew "rcm"
brew "rust"
brew "sqlite"
brew "vim"
brew "tmux"
brew "youtube-dl"
brew "zplug"
brew "zsh"

cask "bartender"
cask "camo-studio"
cask "cleanshot"
cask "font-jetbrains-mono"
cask "iterm2"
cask "hey"
cask "mochi"
