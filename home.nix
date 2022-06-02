{ pkgs, config, ... }:

let
  configuredVimPlugin = pkg:
    let pkgConfig = "${pkg.pname}.lua";
    in {
      plugin = pkg;
      config = builtins.readFile ./config/nvim/${pkgConfig};
      type = "lua";
    };
in {
  home.packages = with pkgs; [
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
    niv
    pure-prompt
    ripgrep
    scc
    shellcheck
    sqlite
    stylua
    yt-dlp
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
    PAGER = "less -FR";
  };

  home.sessionPath = [ ".local/bin" ];

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
      (configuredVimPlugin
        (nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars)))
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
    extraPackages = with pkgs; [
      clojure-lsp
      nodePackages.typescript-language-server
      rnix-lsp
      rubyPackages.solargraph
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

  programs.doom-emacs = {
    enable = false;
    doomPrivateDir = ./doom.d;
    package = pkgs.emacsNativeComp;
    emacsPackagesOverlay = self: super: {
      lsp-mode = super.lsp-mode.overrideAttrs (esuper: {
        buildInputs = esuper.buildInputs ++ [
          pkgs.nodePackages.typescript-language-server
          pkgs.nodePackages.eslint
          pkgs.nodePackages.eslint_d
        ];
      });
    };
  };

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

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws = { disabled = true; };
      docker_context = { disabled = true; };
      git_state = { disabled = true; };
      git_status = { disabled = true; };
      java = { disabled = true; };
      nodejs = { disabled = true; };
      python = { disabled = true; };
      ruby = { disabled = true; };
    };
  };

  programs.topgrade = {
    # TODO re-enable when Topgrade is fixed on darwin
    enable = false;
    settings = {
      disable = [
        "git_repos"
        "gem"
        "github_cli_extensions"
        "node"
        "tlmgr"
        "mas"
        "nix"
        "pipx"
        "pip3"
      ];
      max_concurrency = 12;
      repos = [ "~/Code/*/*" ];
    };
  };

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
