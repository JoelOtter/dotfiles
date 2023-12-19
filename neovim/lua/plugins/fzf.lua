local Plugin = { 'junegunn/fzf.vim' }

Plugin.dependencies = {
  { 'junegunn/fzf' }
}

function Plugin.init()
  local bind = vim.keymap.set

  bind('', '<Leader>y', ':Files<CR>')
  bind('', '<Leader>t', ':GFiles<CR>')
  bind('', '<Leader>r', ':Rg<CR>')
  bind('', '<Leader>m', ':Marks<CR>')
  bind('', '<Leader>j', ':Jumps<CR>')
end

return Plugin
