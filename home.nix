{ pkgs, config, lib, ... }:

{
  imports = [ ./emacs.nix ./git.nix ./neovim.nix ];

  home.packages = with pkgs; [
    asciinema
    awscli2
    babashka
    curl
    fd
    gh
    jq
    neil
    ngrok
    niv
    nodejs
    pure-prompt
    (ripgrep.override { withPCRE2 = true; })
    scc
    sqlite
    yt-dlp
  ];

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
    defaultOptions = [
      "--color=bg+:#ebdbb2,bg:#fbf1c7,spinner:#b57614,hl:#b57614"
      "--color=fg:#3c3836,header:#bdae93,info:#076678,pointer:#076678"
      "--color=marker:#af3a03,fg+:#3c3836,prompt:#7c6f64,hl+:#b57614"
    ];
    changeDirWidgetCommand = "${pkgs.fd}/bin/fd --type d";
    fileWidgetCommand = "${pkgs.fd}/bin/fd --type f";
  };

  programs.bat = {
    enable = true;
    config = { theme = "gruvbox-light"; };
  };

  programs.direnv.enable = true;

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 13;
    };
    keybindings = {
      "cmd+enter" = "launch --cwd=current";
      "cmd+shift+enter" = "new_window";
      "cmd+shift+h" = "neighboring_window left";
      "cmd+shift+j" = "neighboring_window down";
      "cmd+shift+k" = "neighboring_window up";
      "cmd+shift+l" = "neighboring_window right";
    };
    settings = {
      enabled_layouts = "tall, fat, grid, horizontal, vertical";
      confirm_os_window_close = -1;
      macos_option_as_alt = "left";
      macos_show_window_title_in = "window";
      shell_integration = "disabled";
      window_padding_width = "0 1";
      window_border_width = "0";
    };
    theme = "Gruvbox Light";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = false;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "viins";
    initExtra = builtins.readFile ./zshrc;
  };

  programs.bash.enable = true;

  programs.zoxide.enable = true;

  programs.gpg.enable = true;
  xdg.configFile."gnupg/gpg-agent.conf".text = ''
    enable-ssh-support
    default-cache-ttl 86400
    max-cache-ttl 86400
    pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
  '';

  xdg.configFile."shellcheckrc".source = ./shellcheckrc;
  xdg.configFile."karabiner/assets/complex_modifications/escape.json".source =
    ./config/karabiner/assets/complex_modifications/escape.json;

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

  home.file.".lsp/config.edn".source = ./lsp/config.edn;
  home.file.".clojure/deps.edn".source = ./clojure/deps.edn;
  home.file.".clj-kondo/config.edn".source = ./clj-kondo/config.edn;
  home.file.".clj-kondo/hooks/checking.clj".source =
    ./clj-kondo/hooks/checking.clj;
}
