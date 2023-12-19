local Plugin = {'L3MON4D3/LuaSnip'}

Plugin.dependencies = {
  {'rafamadriz/friendly-snippets'}
}

Plugin.lazy = true

function Plugin.config()
  require('luasnip.loaders.from_vscode').lazy_load()
end

return Plugin
