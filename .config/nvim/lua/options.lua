local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
local cmd = vim.cmd


opt.listchars=[[space:·,precedes:«,extends:»,eol:↲,tab:▸\]]
opt.list = true


opt.tabstop=4
opt.shiftwidth=4
opt.softtabstop=4
opt.expandtab = true
opt.smartindent = true

--- Undo Settings
opt.undofile = true
opt.undolevels=1000
opt.undoreload=10000

--- Search Highlighting
opt.ignorecase = true
opt.smartcase = true

--- Current line highlighting
opt.cursorline = true

---Color---
g['dracula_colorterm'] = 0
cmd('colorscheme dracula')
opt.bg = dark
opt.termguicolors = true

---LineWrap---
opt.wrap = true
opt.formatoptions='qrn1'
opt.nu = true
opt.relativenumber = true

---Swap settings
opt.backup = true
-- opt.noswapfile = true

local home_dir = os.getenv('HOME')
opt.undodir=home_dir..'/.local/share/nvim/tmp/undo/'
opt.backupdir=home_dir..'/.local/share/nvim/tmp/backup/'
opt.directory=home_dir..'/.local/share/nvim/tmp/swap/'

---Terraform Settings
g['terraform_fmt_on_save'] = 1
g['terraform_align'] = 1

---Ctrl - P Settings
cmd 'set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,/node_modules/*'


--- Copy/Paste
--[[
opt.clipboard=unnamedplus
vnoremap  <leader>y  ---+y
nnoremap  <leader>Y  ---+yg_
nnoremap  <leader>y  ---+y
nnoremap <leader>p ---+p
nnoremap <leader>P ---+P
vnoremap <leader>p ---+p
vnoremap <leader>P ---+P
]] --


--- Only color up to the first 512 characters
opt.synmaxcol=1000

if vim.fn.executable('rg')
then
  opt.grepprg=rg
end


g.coc_global_extensions = {'coc-json', 'coc-yaml', 'coc-css', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-pyright', 'coc-tailwindcss'}
local cocloc = home_dir..'/.config/nvim/lua/plugins/coc.vim'
vim.cmd(string.format([[source %s]], cocloc))

