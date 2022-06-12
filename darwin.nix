{ config, pkgs, ... }: {
  # Have nix-darwin manage the Nix daemon
  services.nix-daemon.enable = true;

  users.nix.configureBuildUsers = true;

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
    brews = [ "docker-credential-helper-ecr" ];
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
      "pritunl"
      "raycast"
      "screenflow"
      "signal"
      "slack"
      "sonos"
      "soulver"
      "timing"
      "the-unarchiver"
      "thingsmacsandboxhelper"
      "tla-plus-toolbox"
      "tuple"
      "vlc"
      "zoom"
      "zsa-wally"
    ];
    extraConfig = ''
      brew "emacs-mac", args: ["with-native-comp", "with-natural-title-bar"]
    '';
    masApps = {
      Craft = 1487937127;
      Deliveries = 290986013;
      Fantastical = 975937182;
      Flow = 1423210932;
      "Grammarly for Safari" = 1462114288;
      Things = 904280696;
    };
  };
}
