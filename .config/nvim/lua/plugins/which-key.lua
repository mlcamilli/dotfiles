return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "modern",
    })
    
    -- Register keybind groups
    wk.add({
      { "<leader>s", group = "Search" },
      { "g", group = "Goto" },
    })
  end,
}