{ config, pkgs, ... }:

{
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

  networking.hostName = "nsmith165b";

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
    ];
    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/core"
    ];
    casks = [
      "1password"
      "1password-cli"
      "alloy"
      "bartender"
      "chromium"
      "cleanshot"
      "dash"
      "deckset"
      "firefox"
      "google-chrome"
      "grammarly"
      "hey"
      "intellij-idea"
      "karabiner-elements"
      "kindle"
      "mochi"
      "monodraw"
      "obsidian"
      "raycast"
      "reflect"
      "screenflow"
      "signal"
      "slack"
      "sonos"
      "soulver"
      "the-unarchiver"
      "tla-plus-toolbox"
      "tuple"
      "utm"
      "vlc"
      "zoom"
    ];
    masApps = {
      # "Craft" = 1487937127;
      # "DaisyDisk" = 411643860;
      # "Deliveries" = 290986013;
      "Fantastical" = 975937182;
      "Flow" = 1423210932;
      "Grammarly for Safari" = 1462114288;
      "Things" = 904280696;
    };
  };
}
