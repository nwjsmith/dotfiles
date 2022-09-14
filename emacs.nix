{ pkgs, config, lib, ... }:

let
  treesitter = pkgs.tree-sitter.withPlugins
    (p: lib.attrValues (removeAttrs p [ "tree-sitter-nix" ]));
in {
  home.packages = with pkgs; [
    cmake
    coreutils
    discount
    editorconfig-core-c
    fontconfig
    gnuplot
    glib
    nixfmt
    nodePackages.js-beautify
    nodePackages.mermaid-cli
    nodePackages.stylelint
    treesitter
  ];

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
  home.file.".doom.d/snippets/org-mode/project".source =
    ./doom.d/snippets/org-mode/project;
  home.file.".emacs.d/profiles.el".source = ./emacs.d/profiles.el;
  home.file.".local/bin/doom-everywhere" = {
    source = ./local/bin/doom-everywhere;
    executable = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacsGitNativeComp;
  };

  xdg.configFile."emacs/init.el".source = ./config/emacs/init.el;
}
