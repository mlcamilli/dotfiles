-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use {'dracula/vim', as = 'dracula' }
    use 'scrooloose/nerdcommenter'
    use 'tpope/vim-surround'
    use 'flazz/vim-colorschemes'
    use 'ConradIrwin/vim-bracketed-paste'
    use 'airblade/vim-gitgutter'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'ryanoasis/vim-devicons'
    use 'tpope/vim-surround'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'hashivim/vim-terraform'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-lua/plenary.nvim'
    use {'lewis6991/gitsigns.nvim', tag = 'release'}
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    if packer_bootstrap then
        require('packer').sync()
    end
end)

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
