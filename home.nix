{ pkgs, config, lib, ... }:

let
  configuredVimPlugin = pkg:
    let pkgConfig = "${pkg.pname}.lua";
    in {
      plugin = pkg;
      config = builtins.readFile ./config/nvim/${pkgConfig};
      type = "lua";
    };
  treesitter = pkgs.tree-sitter.withPlugins
    (p: lib.attrValues (removeAttrs p [ "tree-sitter-nix" ]));
  emacsPackages = with pkgs; [
    clj-kondo
    clojure-lsp
    coreutils
    discount
    editorconfig-core-c
    fontconfig
    gnuplot
    gopls
    ktlint
    nixfmt
    nodePackages.js-beautify
    nodePackages.mermaid-cli
    nodePackages.stylelint
    nodePackages.typescript-language-server
    rubyPackages.solargraph
    treesitter
  ];
in {
  home.packages = with pkgs;
    [
      asciinema
      awscli2
      babashka
      curl
      dsq
      fd
      gh
      git-absorb
      jless
      jq
      microplane
      neil
      niv
      nodejs
      pure-prompt
      (ripgrep.override { withPCRE2 = true; })
      scc
      shellcheck
      sqlite
      stylua
      yt-dlp
    ] ++ emacsPackages;

  home.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
    PAGER = "less -FR";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.doom.emacs.d/bin"
  ];

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

  xdg.configFile."nvim/nvim.lua".source = ./config/nvim/nvim.lua;
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      (configuredVimPlugin conjure)
      copilot-vim
      direnv-vim
      (configuredVimPlugin fzf-vim)
      (configuredVimPlugin gitsigns-nvim)
      (configuredVimPlugin gruvbox-nvim)
      (configuredVimPlugin lualine-nvim)
      nvim-colorizer-lua
      (configuredVimPlugin nvim-lspconfig)
      vim-commentary
      vim-dispatch
      vim-elixir
      vim-eunuch
      vim-fugitive
      vim-git
      vim-jack-in
      vim-nix
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
      execute "luafile ${config.xdg.configHome}/nvim/nvim.lua"
    '';
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
    ignores = [ ".#*" ".DS_Store" ".dir-locals.el" ".idea/" ".vscode/" ];
    includes = [{
      path = "${config.xdg.configHome}/git/wealthsimple.gitconfig";
      condition = "gitdir:~/Code/wealthsimple/";
    }];
  };

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

  home.activation = {
    installChemacs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      CHEMACS="${config.home.homeDirectory}/.emacs.d"
      [ ! -d $CHEMACS ] && \
        $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 https://github.com/plexus/chemacs2.git $CHEMACS
    '';
    installDoom = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      DOOM="${config.home.homeDirectory}/.doom.emacs.d"
      [ ! -d $DOOM ] && \
        $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 https://github.com/doomemacs/doomemacs.git $DOOM
    '';
  };

  home.file.".emacs-profiles.el".source = ./emacs-profiles.el;
  home.file.".doom.d/init.el".source = ./doom.d/init.el;
  home.file.".doom.d/packages.el".source = ./doom.d/packages.el;
  home.file.".doom.d/config.el".source = ./doom.d/config.el;
  home.file.".doom.d/snippets/org-mode/project".source =
    ./doom.d/snippets/org-mode/project;

  home.file.".nano.emacs.d/init.el".source = ./nano.emacs.d/init.el;

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

  home.file.".local/bin/doom-everywhere" = {
    source = ./local/bin/doom-everywhere;
    executable = true;
  };

  home.file.".lsp/config.edn".source = ./lsp/config.edn;
  home.file.".clojure/deps.edn".source = ./clojure/deps.edn;
  home.file.".clj-kondo/config.edn".source = ./clj-kondo/config.edn;
  home.file.".clj-kondo/hooks/checking.clj".source =
    ./clj-kondo/hooks/checking.clj;
}
