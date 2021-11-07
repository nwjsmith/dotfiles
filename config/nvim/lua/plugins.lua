require("packer").startup(function()
  use("neovim/nvim-lspconfig")
  use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim' 
  })
  use("norcalli/nvim-colorizer.lua")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
  use("shaunsingh/nord.nvim")
  use("tpope/vim-apathy")
  use("tpope/vim-commentary")
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  use("tpope/vim-fugitive")
  use("tpope/vim-repeat")
  use("tpope/vim-rhubarb")
  use("tpope/vim-sleuth")
  use("tpope/vim-speeddating")
  use("tpope/vim-surround")
  use("tpope/vim-vinegar")
  use("wbthomason/packer.nvim")
end)
