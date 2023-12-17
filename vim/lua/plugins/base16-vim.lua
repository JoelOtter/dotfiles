local Plugin = {'chriskempson/base16-vim'}

function Plugin.init()
  vim.cmd [[
    let bse16colorspace=256
    colorscheme base16-materia
  ]]
end

return Plugin
