local Plugin = { 'junegunn/goyo.vim' }

Plugin.dependencies = {
  { 'junegunn/limelight.vim' }
}

Plugin.keys = {
  { '<leader>g', ':Goyo<cr>' }
}

function Plugin.init()
  vim.g.goyo_width = 81

  local function enter()
    vim.opt.scrolloff = 999
    vim.opt.linebreak = true
    vim.opt.textwidth = 80
    vim.opt.signcolumn = "no"
    vim.g.cmp_disabled = true
    vim.cmd('Limelight')
  end

  local function leave()
    vim.opt.scrolloff = 5
    vim.opt.linebreak = false
    vim.opt.textwidth = 0
    vim.opt.signcolumn = "yes"
    vim.g.cmp_disabled = false
    vim.cmd('Limelight!')
  end

  local augroup = vim.api.nvim_create_augroup('goyo_cmds', { clear = true })
  local autocmd = vim.api.nvim_create_autocmd
  autocmd('User', { pattern = 'GoyoEnter', group = augroup, callback = enter })
  autocmd('User', { pattern = 'GoyoLeave', group = augroup, callback = leave })
end

return Plugin
