-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local fn = vim.fn
local cmd = vim.cmd
local opt = vim.opt
require("lazy").setup(
  {

    "williamboman/mason.nvim",
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
      },
      event = "VeryLazy",
    },
    {
      'nvim-lualine/lualine.nvim',
      config = function() require('plugins.lualine') end,
      event = "VeryLazy",
    },
    {
      'lewis6991/gitsigns.nvim',
      branch = 'main',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function() require('plugins.gitsigns') end,
      event = "VeryLazy",
    },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, 'nvim-lua/plenary.nvim' },
      config = function() require('plugins.telescope') end
    },
    {
      "iamcco/markdown-preview.nvim",
      build = function() vim.fn["mkdp#util#install"]() end,
      event = "VeryLazy",
    },
    {
      "akinsho/bufferline.nvim",
      event = "VeryLazy",
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function() require('plugins.bufferline') end,
    },
    {
      "folke/trouble.nvim",
      event = "VeryLazy",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function() require("trouble").setup() end
    },
    {
      "folke/todo-comments.nvim",
      event = "VeryLazy",
      dependencies = "nvim-lua/plenary.nvim",
      config = function() require("todo-comments").setup() end
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, config = function() require("ibl").setup() end },
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function
    },
    { "windwp/nvim-ts-autotag" }

  },
  {
    install = {
      -- install missing plugins on startup. This doesn't increase startup time.
      missing = true,
      -- try to load one of these colorschemes when starting an installation during startup
      colorscheme = { "dracula" },
    }
  }
)
