{ config, pkgs, ... }:

{
  imports = [ ./overlays ];
  # Have nix-darwin manage the Nix daemon
  services.nix-daemon.enable = true;

  nix.configureBuildUsers = true;

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      emacs-all-the-icons-fonts
      inter
      roboto-mono
    ];
  };

  # We use Nix flakes
  nix.extraOptions = "experimental-features = nix-command flakes";

  # Ensure nix-darwin configures ZSH with a Nix-aware PATH
  programs.zsh = {
    enable = true;
    enableBashCompletion = false;
    enableCompletion = false;
    loginShellInit = ''
      eval "$(${config.homebrew.brewPrefix}/brew shellenv)"
    '';
    promptInit = "";
  };

  environment = {
    darwinConfig = "$HOME/.dotfiles/darwin.nix";
    systemPackages = with pkgs; [ kitty terminal-notifier ];
    shells = with pkgs; [ bashInteractive zsh ];
    variables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    global.brewfile = true;
    brews = [
      "watchman"
      {
        name = "emacs-mac";
        args = [
          "with-mac-metal"
          "with-native-comp"
          "with-natural-title-bar"
          "with-starter"
          "with-xwidgets"
        ];
      }
      # emacs-mac deps are explicitly listed so that others can be removed
      "m4"
      "autoconf"
      "automake"
      "bdw-gc"
      "gmp"
      "isl"
      "mpfr"
      "libmpc"
      "gcc"
      "gettext"
      "libtool"
      "libunistring"
      "pkg-config"
      "guile"
      "libidn2"
      "libnghttp2"
      "libtasn1"
      "nettle"
      "p11-kit"
      "unbound"
      "gnutls"
      "jansson"
      "libgccjit"
      "libxml2"
      "texinfo"
    ];
    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/core"
      "railwaycat/emacsmacport"
    ];
    casks = [
      "1password"
      "1password-cli"
      "alloy"
      "bartender"
      "camo-studio"
      "chromium"
      "cleanshot"
      "dash"
      "deckset"
      "docker"
      "firefox"
      "google-chrome"
      "grammarly"
      "hey"
      "intellij-idea"
      "karabiner-elements"
      "kindle"
      "mochi"
      "monodraw"
      "pritunl"
      "raycast"
      "reflect"
      "screenflow"
      "signal"
      "slack"
      "sonos"
      "soulver"
      "syncthing"
      "timing"
      "the-unarchiver"
      "thingsmacsandboxhelper"
      "tla-plus-toolbox"
      "tuple"
      "utm"
      "vlc"
      "zoom"
      "zsa-wally"
    ];
    masApps = {
      # "Craft" = 1487937127;
      # "DaisyDisk" = 411643860;
      # "Deliveries" = 290986013;
      "Fantastical" = 975937182;
      "Flow" = 1423210932;
      "Grammarly for Safari" = 1462114288;
      "Tailscale" = 1475387142;
      "Things" = 904280696;
    };
  };
}
