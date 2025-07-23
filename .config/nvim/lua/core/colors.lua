vim.cmd([[
    hi! link NormalFloat DraculaBg
    hi! link FloatBorder DraculaWhite
    hi! link Keywords DraculaCyan
]])

-- Make hidden files use normal text color in Snacks picker/explorer
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Normal" })

-- Make directories use the same highlight as files in Snacks picker
vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "SnacksPickerFile" })
