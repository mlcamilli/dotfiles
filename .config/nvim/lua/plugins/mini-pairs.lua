return {
  'echasnovski/mini.pairs',
  -- Can't be lazy or it will overwrite keybinds...
  -- event = "VeryLazy",
  config = function()
    require('mini.pairs').setup()
  end
}
