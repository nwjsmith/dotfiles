{ config, enable, pkgs }:
let
  configuredVimPlugin = pkg: {
    plugin = pkg;
    config = builtins.readFile ./config/nvim/${pkg.pname}.lua;
    type = "lua";
  };
in {
  inherit enable;

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
    rubyPackages.solargraph
    nodePackages.typescript-language-server
  ];
}
