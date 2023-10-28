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
    {
      'dracula/vim',
      name = 'dracula',
      lazy = false,
      priority = 1000,
      config = function()
        opt.bg = "dark"
        opt.termguicolors = true
        cmd([[colorscheme dracula]])
      end,
    },
    {
      'kyazdani42/nvim-tree.lua',
      dependencies = { 'nvim-tree/nvim-web-devicons', },
      tag = 'nightly',
      config = function() require('plugins.nvim-tree') end
    },
    'flazz/vim-colorschemes',
    'stevearc/dressing.nvim',
    'rcarriga/nvim-notify',
    'ConradIrwin/vim-bracketed-paste',
    {
      'nvim-treesitter/nvim-treesitter',
      dependences = { "windwp/nvim-ts-autotag" },
      build = function()
        require('nvim-treesitter.install').update(
          { with_sync = true, prefer_git = true })
      end,
      config = function() require('plugins.nvim-treesitter') end
    },
    'ryanoasis/vim-devicons',
    {
      "kylechui/nvim-surround",
      config = function() require("nvim-surround").setup({}) end,
      event = "VeryLazy",
    },
    {
      'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end,
      event = "VeryLazy",
    },
    "williamboman/mason.nvim",
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
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
      tag = '0.1.1',
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
