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
    defaultOptions = [
      "--color=bg+:#ebdbb2,bg:#fbf1c7,spinner:#b57614,hl:#b57614"
      "--color=fg:#3c3836,header:#bdae93,info:#076678,pointer:#076678"
      "--color=marker:#af3a03,fg+:#3c3836,prompt:#7c6f64,hl+:#b57614"
    ];
  };

  programs.bat = {
    enable = true;
    config = { theme = "gruvbox-light"; };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      nix_shell.disabled = true;
    };
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

  home.file.".local/bin/cycles" = {
    source = ./local/bin/cycles;
    executable = true;
  };
}
