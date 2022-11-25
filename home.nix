{ config, lib, pkgs, ... }:

{
  imports =
    [ ./clojure.nix ./git.nix ./gpg.nix ./kitty.nix ./neovim.nix ./zsh.nix ];

  home.packages = with pkgs; [
    asciinema
    amazon-ecr-credential-helper
    docker-credential-helpers
    awscli2
    colima
    curl
    docker-client
    docker-compose
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

    # Doom Emacs stuff
    coreutils
    discount
    editorconfig-core-c
    fontconfig
    gnuplot
    (tree-sitter.withPlugins (_: tree-sitter.allGrammars))
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs.overrideAttrs (original: {
      patches = (original.patches or [ ]) ++ [
        ./emacs/patches/fix-window-role.patch
        ./emacs/patches/system-appearance.patch
        ./emacs/patches/increase-block-alignment.patch
      ];
    });
    extraPackages = (epkgs: [ epkgs.vterm ]);
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
  home.file.".doom.d/doom.svg".source = ./doom.d/doom.svg;
  home.file.".emacs.d/profiles.el".source = ./emacs.d/profiles.el;
  home.file.".docker/config.json".text = builtins.toJSON {
    currentContext = "colima";
    credHelpers = {
      "526316940316.dkr.ecr.ca-central-1.amazonaws.com" = "ecr-login";
      "526316940316.dkr.ecr.us-east-1.amazonaws.com" = "ecr-login";
    };
  };

  xdg.configFile = {
    "shellcheckrc".source = ./shellcheckrc;

    "karabiner/assets/complex_modifications/escape.json".source =
      ./config/karabiner/assets/complex_modifications/escape.json;
  };
}
