{ pkgs, config, ... }:

{
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = builtins.readFile ./config/nvim/init.lua;
    extraPackages = with pkgs; [
      clojure-lsp
      fd
      gh
      jdt-language-server
      nodePackages.typescript-language-server
      ripgrep
    ];
    plugins = with pkgs.vimPlugins; [
      {
        plugin = conjure;
        type = "lua";
        config = builtins.readFile ./config/nvim/after/plugin/conjure.lua;
      }
      copilot-vim
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./config/nvim/after/plugin/lspconfig.lua;
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = builtins.readFile ./config/nvim/after/plugin/treesitter.lua;
      }
      nvim-web-devicons
      {
        plugin = octo-nvim;
        type = "lua";
        config = builtins.readFile ./config/nvim/after/plugin/octo.lua;
      }
      plenary-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile ./config/nvim/after/plugin/telescope.lua;
      }
      vim-fugitive
      vim-gnupg
      vim-surround
      vim-vinegar
    ];
  };
}
