local Plugin = {'junegunn/goyo.vim'}

Plugin.dependencies = {
  {'junegunn/limelight.vim'}
}

function Plugin.init()
  vim.g.goyo_width = 81

  local function enter()
    vim.opt.scrolloff = 999
    vim.opt.linebreak = true
    vim.opt.textwidth = 80
    vim.cmd('Limelight')
  end

  local function leave()
    vim.opt.scrolloff = 5
    vim.opt.linebreak = false
    vim.opt.textwidth = 0
    vim.cmd('Limelight!')
  end
end

return Plugin
