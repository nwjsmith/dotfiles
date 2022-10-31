{ pkgs, ... }:

{
  imports = [
    ./clojure.nix
    ./emacs.nix
    ./git.nix
    ./gpg.nix
    ./kitty.nix
    ./neovim.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    asciinema
    amazon-ecr-credential-helper
    awscli2
    colima
    curl
    docker-client
    fd
    gh
    jq
    ngrok
    niv
    nodejs
    (ripgrep.override { withPCRE2 = true; })
    scc
    sqlite
    yt-dlp
  ];

  xdg.configFile = {
    "shellcheckrc".source = ./shellcheckrc;

    "karabiner/assets/complex_modifications/escape.json".source =
      ./config/karabiner/assets/complex_modifications/escape.json;
  };
}
