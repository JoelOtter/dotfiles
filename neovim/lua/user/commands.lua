local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup('init_cmds', {clear = true})

autocmd('FileType', {
  group = augroup,
  pattern = {'cpp','c','objc','objcpp','cmake'},
  command = 'setlocal noexpandtab'
})
