require('bufferline').setup({
  options = {
    -- separator_style = 'padded_slant',
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true
      }
    },
  }
})
