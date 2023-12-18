-- Tabs, etc.
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Appearance
vim.opt.colorcolumn = "81"
vim.opt.scrolloff = 5
vim.opt.hidden = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "number"
vim.opt.cmdheight = 2
vim.opt.shortmess:append("c")
vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Basic sensible things
vim.opt.mouse = "a"
vim.opt.backspace = "2"
vim.opt.swapfile = false
vim.opt.laststatus = 2

-- Netrw
vim.g['netrw_banner'] = 0
vim.g['netrw_liststyle'] = 3
vim.g['netrw_browse_split'] = 4
vim.g['netrw_altv'] = 1
vim.g['netrw_winsize'] = 15
vim.g['netrw_list_hide'] = vim.opt.wildignore
