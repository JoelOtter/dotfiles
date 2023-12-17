local Plugin = {'junegunn/fzf.vim'}

Plugin.dependencies = {
  {'junegunn/fzf'}
}

function Plugin.init()
  local bind = vim.keymap.set

  bind('', '<Leader>y', ':Files<CR>')
  bind('', '<Leader>t', ':GFiles<CR>')
end

return Plugin
