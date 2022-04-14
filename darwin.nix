{ config, pkgs, ... }: {
  # Have nix-darwin manage the Nix daemon
  services.nix-daemon.enable = true;
  users.nix.configureBuildUsers = true;

  fonts = {
    enableFontDir = true;
    fonts = [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
  };

  # We use Nix flakes
  nix.extraOptions = "experimental-features = nix-command flakes";

  # Ensure nix-darwin configures ZSH with a Nix-aware PATH
  programs.zsh = {
    enable = true;
    shellInit = ''
      eval "$(${config.homebrew.brewPrefix}/brew shellenv)"
    '';
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
    autoUpdate = true;
    cleanup = "zap";
    global = {
      brewfile = true;
      noLock = true;
    };
    brews = [
      "docker-credential-helper-ecr"
      "node-build"
      "nodenv"
      "pyenv"
      "ruby-build"
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
      "appcleaner"
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
      "pritunl"
      "raycast"
      "screenflow"
      "signal"
      "slack"
      "sonos"
      "soulver"
      "the-unarchiver"
      "thingsmacsandboxhelper"
      "tla-plus-toolbox"
      "tuple"
      "vlc"
      "zoom"
      "zsa-wally"
    ];
    masApps = {
      Craft = 1487937127;
      Deliveries = 290986013;
      Fantastical = 975937182;
      Flow = 1423210932;
      "Grammarly for Safari" = 1462114288;
      Reeder = 1529448980;
      Things = 904280696;
    };
  };
}
