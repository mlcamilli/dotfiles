local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
local cmd = vim.cmd

---Color---
cmd('colorscheme dracula')
opt.bg = "dark"
opt.termguicolors = true



opt.listchars=[[space:·,precedes:«,extends:»,eol:↲,tab:▸\]]
opt.list = true


opt.tabstop=4
opt.shiftwidth=4
opt.softtabstop=4
opt.expandtab = true
opt.smartindent = true

--- Undo Settings
cmd('set undofile')
opt.undolevels=1000
opt.undoreload=10000

--- Search Highlighting
opt.ignorecase = true
opt.smartcase = true

--- Current line highlighting
opt.cursorline = true

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

---Ctrl - P Settings
cmd 'set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,/node_modules/*'


--- Only color up to the first 512 characters
opt.synmaxcol=1000

if vim.fn.executable('rg')
then
  opt.grepprg="rg"
end
