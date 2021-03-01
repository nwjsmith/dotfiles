# vim: set ft=ruby

tap "d12frosted/emacs-plus"
tap "clojure/tools"
tap "clojure-lsp/brew"
tap "github/gh"
tap "homebrew/bundle"
tap "homebrew/core"
tap "homebrew/cask"
tap "homebrew/cask-drivers"
tap "homebrew/cask-fonts"
tap "homebrew/services"
tap "universal-ctags/universal-ctags"

cask_args appdir: "/Applications"

def load_brewfile(brewfile)
  path = File.expand_path(brewfile, __dir__)
  instance_eval(File.read(brewfile), path) if File.exist?(brewfile)
end

load_brewfile ".Brewfile.arch"
load_brewfile ".Brewfile.host"

brew "adr-tools"
brew "antigen"
brew "asdf"
brew "aspell"
brew "automake"
brew "awscli"
brew "bash"
brew "bat"
brew "clojure/tools/clojure"
brew "clojure-lsp/brew/clojure-lsp-native"
brew "cmake"
brew "coreutils"
brew "emacs-plus@27"
brew "fd"
brew "ffmpeg"
brew "fzf"
brew "gawk"
brew "gh"
brew "gist"
brew "git"
brew "git-absorb"
brew "gnu-sed"
brew "gnupg"
brew "graphviz"
brew "htop"
brew "imagemagick"
brew "ispell"
brew "jq"
brew "libffi"
brew "libvterm"
brew "libxml2"
brew "libyaml"
brew "mas"
brew "maven"
brew "mitmproxy"
brew "multimarkdown"
brew "nomad"
brew "neovim", args: %w(HEAD)
brew "nodejs"
brew "oniguruma"
brew "openjdk"
brew "openssl@1.1"
brew "pgformatter"
brew "pinentry-mac"
brew "pkg-config"
brew "postgresql"
brew "python@3.9"
brew "rcm"
brew "readline"
brew "reattach-to-user-namespace"
brew "redis"
brew "ripgrep"
brew "rlwrap"
brew "rustup-init"
brew "shfmt"
brew "sqlite"
brew "starship"
brew "tmux"
brew "topgrade"
brew "tree"
brew "universal-ctags", args: %w(HEAD)
brew "varnish"
brew "vim"
brew "watch"
brew "wget"
brew "youtube-dl"
brew "zlib"
brew "zsh"

cask "1password"
cask "1password-cli"
cask "alloy"
cask "bartender"
cask "camo-studio"
cask "cleanshot"
cask "deckset"
cask "font-jetbrains-mono"
cask "google-chrome"
cask "grammarly"
cask "hey"
cask "iterm2"
cask "keyboard-maestro"
cask "kindle"
cask "mochi"
cask "screenflow"
cask "signal"
cask "slack"
cask "sonos"
cask "soulver"
cask "spotify"
cask "steam"
cask "the-unarchiver"
cask "thingsmacsandboxhelper"
cask "tla-plus-toolbox"
cask "vlc"
cask "zoom"
cask "zotero"
cask "zsa-wally"

mas "1Blocker", id: 1107421413
mas "Bear", id: 1091189122
mas "DaisyDisk", id: 411643860
mas "Deliveries", id: 924726344
mas "Fantastical", id: 975937182
mas "Flow", id: 1423210932
mas "Grammarly for Safari", id: 1462114288
mas "Instapaper Save", id: 1481302432
mas "Instapaper", id: 288545208
mas "Keynote", id: 409183694
mas "Marked 2", id: 890031187
mas "Numbers", id: 409203825
mas "Pages", id: 409201541
mas "Reeder", id: 1529448980
mas "Things", id: 904280696
mas "Xcode", id: 497799835
