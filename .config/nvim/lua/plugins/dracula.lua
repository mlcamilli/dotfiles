return {
  'dracula/vim',
  name = 'dracula',
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.bg = "dark"
    vim.opt.termguicolors = true
    vim.cmd([[colorscheme dracula]])
    vim.cmd([[
    hi! link NormalFloat DraculaBg
    hi! link FloatBorder DraculaWhite
    hi! link Keywords DraculaCyan
    ]])
  end,
}
