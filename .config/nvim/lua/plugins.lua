-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd [[packadd packer.nvim]]
end

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons', },
        tag = 'nightly',
        config = function() require('plugins.nvim-tree') end
    }
    use {'dracula/vim', as = 'dracula' }
    use 'flazz/vim-colorschemes'
    use 'ConradIrwin/vim-bracketed-paste'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        config = function() require('plugins.nvim-treesitter') end
    }
    use 'ryanoasis/vim-devicons'
    use({
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup({}) end
    })
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    use {'neoclide/coc.nvim', branch = 'release'}
    use 'hashivim/vim-terraform'
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('plugins.lualine') end
    }
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('plugins.gitsigns') end
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        config = function() require('plugins.telescope') end
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    if packer_bootstrap then
        require('packer').sync()
    end
end)


