local Plugin = { 'tinted-theming/tinted-vim' }

function Plugin.init()
  vim.g.tinted_colorspace = 256
  vim.cmd.colorscheme('base16-materia')
end

Plugin.priority = 1000
Plugin.lazy = false

return Plugin
