{ config, lib, pkgs, ... }:

{
  home.stateVersion = "22.05";

  imports =
    [ ./alacritty.nix ./clojure.nix ./git.nix ./gpg.nix ./kitty.nix ./neovim.nix ./zsh.nix ];

  home.packages = with pkgs; [
    amazon-ecr-credential-helper
    asciinema
    awscli2
    colima
    curl
    d2
    docker-client
    docker-compose
    docker-credential-helpers
    fd
    gh
    jq
    nodePackages.mermaid-cli
    ngrok
    niv
    nodejs
    (ripgrep.override { withPCRE2 = true; })
    scc
    sqlite
    tarsnap
    tmux
    yt-dlp

    # Doom Emacs stuff
    coreutils
    discount
    editorconfig-core-c
    fontconfig
    gnuplot
    pandoc
    (tree-sitter.withPlugins (_: tree-sitter.allGrammars))
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29.overrideAttrs (original: {
      patches = (original.patches or [ ]) ++ [
        ./emacs/patches/fix-window-role.patch
        ./emacs/patches/system-appearance.patch
        ./emacs/patches/increase-block-alignment.patch
      ];
    });
    extraPackages = (epkgs: [ epkgs.vterm ]);
  };

  programs.home-manager.enable = true;

  home.file.".local/bin/tarsnap-backup" = {
    executable = true;
    text = ''
      #!/bin/sh
      ${pkgs.tarsnap}/bin/tarsnap -c \
        -f "$(uname -n)-$(date +%Y-%m-%d_%H-%M-%S)" \
        ${config.home.homeDirectory}/Documents/org
    '';
  };

  home.sessionPath = [ "${config.home.homeDirectory}/.emacs.d/bin" ];

  home.activation = {
    installDoom = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      DOOM="${config.home.homeDirectory}/.emacs.d"
      [ ! -d $DOOM ] && \
        $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 https://github.com/doomemacs/doomemacs.git $DOOM
    '';
  };
  home.file.".doom.d/init.el".source = ./doom.d/init.el;
  home.file.".doom.d/packages.el".source = ./doom.d/packages.el;
  home.file.".doom.d/config.el".source = ./doom.d/config.el;
  home.file.".doom.d/w.svg".source = ./doom.d/w.svg;
  home.file.".emacs.d/profiles.el".source = ./emacs.d/profiles.el;

  xdg.configFile = {
    "shellcheckrc".source = ./shellcheckrc;

    "karabiner/assets/complex_modifications/escape.json".source =
      ./config/karabiner/assets/complex_modifications/escape.json;
  };
}
