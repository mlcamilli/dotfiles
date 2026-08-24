return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = {
      enabled = true,
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["K"] = "list_top",
            ["J"] = "list_bottom",
          },
        },
        list = {
          keys = {
            ["K"] = "list_top",
            ["J"] = "list_bottom",
          },
        },
      },
      sources = {
        files = { hidden = true },
        grep = { hidden = true },
        explorer = {
          hidden = true,
          ignored = false,                                           -- Show git-ignored files
          exclude = { ".git", "**/node_modules", "**/__pycache__" }, -- Exclude these patterns
          win = {
            list = { keys = { ["<C-n>"] = "close" } },
            input = { keys = { ["<C-n>"] = { "close", mode = { "n", "i" } } } },
          },
        },
      },
    },
    notifier = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    toggle = { enabled = true },
    zen = { enabled = true }
  },
}
