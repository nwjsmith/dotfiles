{ pkgs, ... }:

{
  home.packages = with pkgs; [
    asciinema
    awscli
    fd
    gh
    git
    git-absorb
    delta
    gnupg
    jq
    microplane
    pure-prompt
    rbenv
    ripgrep
    scc
    shellcheck
    shfmt
    sqlite
    stylua
    yt-dlp
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
    PAGER = "less -FR";
  };

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

  xdg.configFile."nvim/nvim.lua".text = builtins.readFile ./nvim.lua;
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      conjure
      copilot-vim
      direnv-vim
      fzf-vim
      gitsigns-nvim
      gruvbox-nvim
      lualine-nvim
      nvim-colorizer-lua
      nvim-lspconfig
      vim-commentary
      vim-dispatch
      vim-elixir
      vim-eunuch
      vim-fugitive
      vim-git
      vim-jack-in
      vim-repeat
      vim-rhubarb
      vim-sexp
      vim-sexp-mappings-for-regular-people
      vim-sleuth
      vim-speeddating
      vim-surround
      vim-test
      vim-unimpaired
      vim-vinegar
      zoxide-vim
    ];
    extraConfig = ''
      let s:nvim = expand("<sfile>:p:h") . "/nvim.lua"
      execute "luafile " . s:nvim
    '';
    extraPackages = with pkgs; [
      rubyPackages.solargraph
      nodePackages.typescript-language-server
    ];
  };

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

  programs.git = {
    enable = true;
    userEmail = "nsmith@wealthsimple.com";
    userName = "Nate Smith";
    aliases = {
      co = "checkout";
      dc = "diff --cached";
      di = "diff";
      st = "status";
      unstage = "reset --";
      yolo = "push --force-with-lease";
    };
    extraConfig.init.defaultBranch = "main";
    delta = {
      enable = true;
      options = { syntax-theme = "gruvbox-light"; };
    };
  };

  programs.gpg.enable = true;
  xdg.configFile."gnupg/gpg-agent.conf".text = ''
    enable-ssh-support
    default-cache-ttl 86400
    max-cache-ttl 86400
    pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
  '';
}
