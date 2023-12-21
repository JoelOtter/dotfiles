-- Bind options
local bind = vim.keymap.set
local remap = { remap = true }

-- Leader
vim.g.mapleader = ' '

-- Buffers
bind('', '<Leader>w', ':update<CR>')
bind('', '<Leader>e', ':e<CR>')

-- General text things
bind('', '<Leader>a', ':set wrap!<CR>')
bind('', '<Leader>s', ':set spell! spelllang=en_gb<CR>')
bind('', '<Leader>h', ':noh<CR>')

-- Window
bind('', '<Leader>v', ':vsplit<CR>')
bind('', '<Leader>=', '<C-w>=')
bind('', '<Leader>c', '<C-w>c')

-- Disable help on F1
bind('', '<F1>', '<NOP>')
