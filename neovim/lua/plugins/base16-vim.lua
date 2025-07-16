local Plugin = { 'tinted-theming/tinted-vim' }

function Plugin.init()
  vim.g.tinted_colorspace = 256
  vim.cmd.colorscheme('base16-materia')

  -- Airline uses the difftext colour to set its own colours for some reason
  vim.cmd [[
    hi DiffText ctermfg=4 ctermbg=18 guifg=#89ddff guibg=#2c393f
  ]]
end

Plugin.priority = 1000
Plugin.lazy = false

return Plugin
