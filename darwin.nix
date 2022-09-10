{ config, pkgs, ... }: {
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
    systemPackages = with pkgs; [ kitty terminal-notifier ];
    shells = with pkgs; [ bashInteractive zsh ];
    variables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
      TERMINFO_DIRS = "${pkgs.kitty.terminfo.outPath}/share/terminfo";
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
      "docker-credential-helper-ecr"
      "watchman"
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
      "emacs-mac"
      "firefox"
      "google-chrome"
      "grammarly"
      "hey"
      "intellij-idea"
      "karabiner-elements"
      "kindle"
      "mochi"
      "raycast"
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
