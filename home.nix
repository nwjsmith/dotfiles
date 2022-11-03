{ config, lib, pkgs, ... }:

{
  imports =
    [ ./clojure.nix ./git.nix ./gpg.nix ./kitty.nix ./neovim.nix ./zsh.nix ];

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

  programs.emacs = {
    enable = true;
    package = pkgs.emacs.overrideAttrs(original: {
      patches = (original.patches or []) ++ [
        ./emacs/patches/fix-window-role.patch
        ./emacs/patches/system-appearance.patch
      ];
    });
    extraPackages = (epkgs:
      (with epkgs; [ vterm ]) ++ (with pkgs; [
        cmake
        coreutils
        discount
        editorconfig-core-c
        fontconfig
        gnuplot
        nixfmt
        nodePackages.js-beautify
        nodePackages.mermaid-cli
        nodePackages.stylelint
        tree-sitter.allGrammars
      ]));
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

  xdg.configFile."emacs/init.el".source = ./config/emacs/init.el;

  xdg.configFile = {
    "shellcheckrc".source = ./shellcheckrc;

    "karabiner/assets/complex_modifications/escape.json".source =
      ./config/karabiner/assets/complex_modifications/escape.json;
  };
}
