return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function() require("trouble").setup() end
}
