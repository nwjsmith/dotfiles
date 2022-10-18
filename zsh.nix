{ pkgs, config, ... }:

{
  programs.direnv.enable = true;
  programs.zsh = {
    enable = true;
    enableAutosuggestions = false;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "viins";
    initExtra = builtins.readFile ./zshrc;
  };
  programs.zoxide.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
    PAGER = "less -FR";
  };

  home.sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.fzf = {
    enable = true;
    defaultCommand = "${pkgs.fd}/bin/fd --type f";
    changeDirWidgetCommand = "${pkgs.fd}/bin/fd --type d";
    fileWidgetCommand = "${pkgs.fd}/bin/fd --type f";
  };

  programs.bat = {
    enable = true;
    config = { theme = "ansi"; };
  };

  home.file.".local/bin/gem-constraint" = {
    source = ./local/bin/gem-constraint;
    executable = true;
  };
  home.file.".local/bin/gem-latest" = {
    source = ./local/bin/gem-latest;
    executable = true;
  };

  home.file.".local/bin/git-churn" = {
    source = ./local/bin/git-churn;
    executable = true;
  };
  home.file.".local/bin/git-original-branch" = {
    source = ./local/bin/git-original-branch;
    executable = true;
  };

  home.file.".local/bin/ordinalize" = {
    source = ./local/bin/ordinalize;
    executable = true;
  };

}
