require("packer").startup(function()
  use("clojure-vim/vim-jack-in")
  use("elixir-editors/vim-elixir")
  use("gruvbox-community/gruvbox")
  use("guns/vim-sexp")
  use({
    'ibhagwan/fzf-lua',
    requires = { 'vijaymarupudi/nvim-fzf', 'kyazdani42/nvim-web-devicons' }
  })
  use("janet-lang/janet.vim")
  use({"jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" }})
  use("knubie/vim-kitty-navigator")
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use("nanotee/zoxide.vim")
  use("neovim/nvim-lspconfig")
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  use("norcalli/nvim-colorizer.lua")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("Olical/conjure")
  use("shaunsingh/nord.nvim")
  use("tpope/vim-apathy")
  use("tpope/vim-commentary")
  use("tpope/vim-dispatch")
  use("tpope/vim-eunuch")
  use("tpope/vim-fugitive")
  use("tpope/vim-git")
  use("tpope/vim-repeat")
  use("tpope/vim-rhubarb")
  use("tpope/vim-sexp-mappings-for-regular-people")
  use("tpope/vim-sleuth")
  use("tpope/vim-speeddating")
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired")
  use("tpope/vim-vinegar")
  use("vim-test/vim-test")
  use("wbthomason/packer.nvim")
end)
