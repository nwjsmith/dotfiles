{ config, pkgs, ... }: {
  # Have nix-darwin manage the Nix daemon
  services.nix-daemon.enable = true;
  users.nix.configureBuildUsers = true;

  # We use Nix flakes
  nix.extraOptions = "experimental-features = nix-command flakes";

  # Ensure nix-darwin configures ZSH with a Nix-aware PATH
  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "none";
    global = {
      brewfile = true;
      noLock = true;
    };
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
      "font-jetbrains-mono-nerd-font"
      "google-chrome"
      "grammarly"
      "hey"
      "intellij-idea"
      "karabiner-elements"
      "kindle"
      "kitty"
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
