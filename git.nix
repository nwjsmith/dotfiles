{ config, ... }:

{
  xdg.configFile."git/wealthsimple.gitconfig".text = ''
    [user]
    email = nsmith@wealthsimple.com
  '';
  xdg.configFile."git/gitmessage".source = ./config/git/gitmessage;
  programs.git = {
    enable = true;
    userName = "Nate Smith";
    userEmail = "nate@theinternate.com";
    aliases = {
      co = "checkout";
      dc = "diff --cached";
      di = "diff";
      st = "status";
      unstage = "reset --";
      yolo = "push --force-with-lease";
    };
    extraConfig = {
      github.user = "nwjsmith";
      commit = {
        gpgsign = true;
        template = "${config.xdg.configHome}/git/gitmessage";
      };
      fetch.prune = true;
      init.defaultBranch = "main";
      push.default = "current";
      pull.rebase = true;
      rebase = {
        autoSquash = true;
        autoStash = true;
      };
      merge.conflictStyle = "diff3";
    };
    delta = {
      enable = true;
      options = { syntax-theme = "gruvbox-light"; };
    };
    ignores = [
      ".#*"
      ".DS_Store"
      ".dir-locals.el"
      ".direnv/"
      ".idea/"
      ".vscode/"
      ".clj-kondo/"
      ".lsp/"
    ];
    includes = [{
      path = "${config.xdg.configHome}/git/wealthsimple.gitconfig";
      condition = "gitdir:~/Code/wealthsimple/";
    }];
  };
}
