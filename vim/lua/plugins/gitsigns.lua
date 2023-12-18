local Plugin = {'lewis6991/gitsigns.nvim'}

function Plugin.config()
  require('gitsigns').setup()
end

return Plugin
