local Plugin = { 'nvim-tree/nvim-tree.lua' }

Plugin.lazy = false

Plugin.dependencies = {
  { 'nvim-tree/nvim-web-devicons' }
}

Plugin.keys = {
  { '<leader>x', ':NvimTreeFindFileToggle<cr>' }
}

function Plugin.init()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

function Plugin.config()
  require('nvim-tree').setup()
end

return Plugin
