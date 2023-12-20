local Plugin = {'romgrk/barbar.nvim'}

Plugin.dependencies = {
  { 'lewis6991/gitsigns.nvim' },
  { 'nvim-tree/nvim-web-devicons' }
}

Plugin.init = function()
  vim.g.barbar_auto_setup = false
end

Plugin.opts = {
  highlight_visible = true,
  highlight_alternate = true,
  icons = {
    preset = 'powerline',
    buffer_index = true,
  },
  sidebar_filetypes = {
    NvimTree = true
  }
}

return Plugin
