local Plugin = { 'chriskempson/base16-vim' }

function Plugin.init()
  vim.cmd [[
    let base16colorspace=256
    colorscheme base16-materia
  ]]
end

Plugin.priority = 1000
Plugin.lazy = false

return Plugin
