return {
  'echasnovski/mini.completion',
  version = false,
  config = function()
    local completion = require('mini.completion')
    completion.setup()
    
    -- Disable completion when snacks picker is open
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "snacks_picker_input",
      callback = function()
        vim.b.minicompletion_disable = true
      end,
    })
  end
}
