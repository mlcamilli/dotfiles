return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { "windwp/nvim-ts-autotag" },
  event = { "BufReadPost", "BufNewFile" },
  -- event = "VeryLazy",
  build = function()
    require('nvim-treesitter.install').update(
      { with_sync = true, prefer_git = true })
  end,
  config = function()
    require('nvim-treesitter.configs').setup({
      -- One of "all", "maintained" (parsers with maintainers), or a list of languages
      ensure_installed = { "lua", "python", "rust", "javascript", "dockerfile", "go", "json", "make", "toml", "yaml",
        "typescript", "markdown", "css", "html", "bash", "tsx" },
      -- List of parsers to ignore installing
      ignore_install = { "t32" },

      -- Install languages synchronously (only applied to `ensure_installed`)
      sync_install = true,
      prefer_git = true,
      auto_install = true,
      autotag = {
        enable = true
      },

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = {},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

    }
    )
  end
}
