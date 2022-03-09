# vim: set ft=ruby

tap "borkdude/brew"
tap "clojure-lsp/brew"
tap "clojure/tools"
tap "d12frosted/emacs-plus"
tap "fabianishere/personal"
tap "federico-terzi/espanso"
tap "github/gh"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-drivers"
tap "homebrew/cask-fonts"
tap "homebrew/core"
tap "homebrew/services"
tap "shopify/shopify"

cask_args appdir: "/Applications"

def load_brewfile(brewfile)
  path = File.expand_path(brewfile, __dir__)
  instance_eval(File.read(brewfile), path) if File.exist?(brewfile)
end

load_brewfile ".Brewfile.arch"
load_brewfile ".Brewfile.host"

brew "adr-tools"
brew "antigen"
brew "aspell"
brew "automake"
brew "awscli"
brew "bash"
brew "bat"
brew "black"
brew "borkdude/brew/clj-kondo"
brew "clang-format"
brew "clojure-lsp/brew/clojure-lsp-native"
brew "clojure/tools/clojure"
brew "cmake"
brew "coreutils"
brew "deno"
brew "direnv"
brew "editorconfig"
brew "elixir"
brew "emacs-plus@28", args: %w(with-native-comp with-imagemagick)
brew "exa"
brew "federico-terzi/espanso/espanso"
brew "fabianishere/personal/pam_reattach"
brew "fd"
brew "ffmpeg"
brew "fzf"
brew "fswatch"
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
brew "janet"
brew "jq"
brew "libffi"
brew "libvterm"
brew "libxml2"
brew "libyaml"
brew "mas"
brew "maven"
brew "microplane"
brew "mitmproxy"
brew "multimarkdown"
brew "neovim"
brew "node-build"
brew "nodenv"
brew "nomad"
brew "oniguruma"
brew "openjdk"
brew "openssl@1.1"
brew "pandoc"
brew "pgformatter"
brew "pinentry-mac"
brew "pkg-config"
brew "poetry"
brew "postgresql"
brew "pyenv"
brew "pyright"
brew "qemu"
brew "racket"
brew "rbenv"
brew "rcm"
brew "readline"
brew "reattach-to-user-namespace"
brew "redis"
brew "ripgrep"
brew "rlwrap"
brew "ruby-build"
brew "rust-analyzer"
brew "rustup-init"
brew "scc"
brew "shellcheck"
brew "shfmt"
brew "shopify/shopify/toxiproxy"
brew "sqlite"
brew "starship"
brew "stylua"
brew "terminal-notifier"
brew "terraform"
brew "tmux"
brew "topgrade"
brew "tree"
brew "tree-sitter"
brew "tz"
brew "varnish"
brew "vim"
brew "watch"
brew "watchman"
brew "wget"
brew "yamllint"
brew "youtube-dl"
brew "zlib"
brew "zoxide"
brew "zsh"

cask "1password"
cask "1password-cli"
cask "alloy"
cask "appcleaner"
cask "bartender"
cask "camo-studio"
cask "chromium"
cask "cleanshot"
cask "dash"
cask "deckset"
cask "docker"
cask "firefox"
cask "font-jetbrains-mono-nerd-font"
cask "google-chrome"
cask "grammarly"
cask "hey"
cask "insomnia"
cask "karabiner-elements"
cask "keyboard-maestro"
cask "kindle"
cask "kitty"
cask "mochi"
cask "ngrok"
cask "raycast"
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

mas "Craft", id: 1487937127
mas "DaisyDisk", id: 411643860
mas "Deliveries", id: 290986013
mas "Fantastical", id: 975937182
mas "Flow", id: 1423210932
mas "Grammarly for Safari", id: 1462114288
mas "Reeder", id: 1529448980
mas "Things", id: 904280696
