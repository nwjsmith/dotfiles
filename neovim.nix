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
}
