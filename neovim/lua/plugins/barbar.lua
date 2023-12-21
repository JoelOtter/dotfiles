local Plugin = { 'romgrk/barbar.nvim' }

Plugin.lazy = false

Plugin.dependencies = {
  { 'lewis6991/gitsigns.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'vim-airline/vim-airline' }
}

Plugin.keys = {
  { '<F9>',      ':BufferPrevious<CR>' },
  { '<F10>',     ':BufferNext<CR>' },
  { '<Leader>q', ':BufferClose<CR>' },
}

Plugin.init = function()
  vim.g.barbar_auto_setup = false
end

Plugin.config = function()
  local copyColour = function(to, from)
    local hl = vim.api.nvim_get_hl(0, { name = from, link = false })
    vim.api.nvim_set_hl(0, to, hl)
  end

  -- Colours - try to get it as close to airline as possible.
  vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
      copyColour('BufferCurrent', 'airline_a')
      copyColour('BufferCurrentMod', 'airline_a')
      copyColour('BufferCurrentIndex', 'airline_a')
      copyColour('BufferCurrentIcon', 'airline_a')
      copyColour('BufferCurrentSign', 'airline_a')
      copyColour('BufferCurrentSignRight', 'airline_a_to_airline_b')

      copyColour('BufferVisible', 'airline_b_bold')
      copyColour('BufferVisibleMod', 'airline_b_bold')
      copyColour('BufferVisibleIndex', 'airline_b')
      copyColour('BufferVisibleIcon', 'airline_b')
      copyColour('BufferVisibleSign', 'airline_c_inactive')
      copyColour('BufferVisibleSignRight', 'airline_x_to_airline_y')

      copyColour('BufferInactive', 'airline_b')
      copyColour('BufferInactiveMod', 'airline_b')
      copyColour('BufferInactiveIndex', 'airline_b')
      copyColour('BufferInactiveIcon', 'airline_b')
      copyColour('BufferInactiveSign', 'airline_c_inactive')
      copyColour('BufferInactiveSignRight', 'airline_x_to_airline_y')
    end,
  })

  require('barbar').setup({
    highlight_visible = true,
    highlight_alternate = false,
    icons = {
      preset = 'powerline',
      buffer_index = true,
      filetype = {
        custom_colors = true,
      },
    },
    sidebar_filetypes = {
      NvimTree = true
    }
  })
end

return Plugin
