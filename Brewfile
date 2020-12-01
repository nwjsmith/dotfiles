# vim: set ft=ruby

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
brew "awscli"
brew "jq"
brew "mitmproxy"
brew "rcm"
brew "youtube-dl"
brew "zplug"

cask "bartender"
cask "camo-studio"
cask "cleanshot"
cask "font-jetbrains-mono"
cask "iterm2"
cask "hey"
cask "rectangle"
