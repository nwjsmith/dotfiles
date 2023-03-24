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

  security.pam.enableSudoTouchIdAuth = true;

  system = {
    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
        static-only = true;
      };

      NSGlobalDomain = {
        "com.apple.trackpad.scaling" = 3.0;
        AppleFontSmoothing = 0;
        AppleKeyboardUIMode = 3;
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        AppleTemperatureUnit = "Celsius";
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
      };

      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
      };
    };
  };

  services.karabiner-elements.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    global.brewfile = true;
    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/core"
    ];
    casks = [
      "1password"
      "alloy"
      "amythest"
      "balenaetcher"
      "bartender"
      "chromium"
      "cleanshot"
      "dash"
      "deckset"
      "eclipse-ide"
      "firefox"
      "google-chrome"
      "grammarly"
      "hey"
      "intellij-idea"
      "kindle"
      "mochi"
      "monodraw"
      "notion"
      "obsidian"
      "qmk-toolbox"
      "utm"
      "raycast"
      "reflect"
      "screenflow"
      "signal"
      "slack"
      "sonos"
      "soulver"
      "sublime-merge"
      "sublime-text"
      "the-unarchiver"
      "tuple"
      "vlc"
      "zoom"
    ];
    masApps = {
      "Flow" = 1423210932;
      "Grammarly for Safari" = 1462114288;
      "Things" = 904280696;
    };
  };
}
