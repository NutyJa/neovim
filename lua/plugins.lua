local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)
  -- Packer manager
  use { "wbthomason/packer.nvim" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "RRethy/vim-illuminate" }
  use { "hashivim/vim-terraform" }
  use { "jose-elias-alvarez/null-ls.nvim" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  -- snippet
  use { "L3MON4D3/LuaSnip" }

  -- user 
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-telescope/telescope.nvim" }
  use { "nathom/filetype.nvim" }
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
  use { "lewis6991/impatient.nvim" }
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use { "nvim-lualine/lualine.nvim" }
  use { "kyazdani42/nvim-web-devicons" }

  -- colorscheme
  use { "folke/tokyonight.nvim" }

  -- git
  use { "lewis6991/gitsigns.nvim" }

  -- dap
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use { "Pocco81/DAPInstall.nvim" }

  end
)

