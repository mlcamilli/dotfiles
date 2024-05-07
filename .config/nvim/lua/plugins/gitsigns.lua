return {
  'lewis6991/gitsigns.nvim',
  branch = 'main',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = "VeryLazy",
  config = function()
    local opts =
    {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 500,
        ignore_whitespace = true,
      },
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        topdelete = { text = "▎" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      }
    }
    require('plugins.gitsigns').setup(opts)
    vim.cmd([[highlight link GitSignsCurrentLineBlame Comment]])
  end
}
