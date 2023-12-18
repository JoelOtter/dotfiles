local Plugin = {'vim-airline/vim-airline'}

Plugin.dependencies = {
  {'vim-airline/vim-airline-themes'}
}

function Plugin.init()
  vim.g['airline_theme'] = "base16"
  vim.g['airline_powerline_fonts'] = 1
  vim.g['airline#extensions#tabline#enabled'] = 1
  vim.g['airline#extensions#tabline#show_buffers'] = 1
  vim.g['airline#extensions#tabline#show_tabs'] = 0
  vim.g['airline#extensions#tabline#formatter'] = "unique_tail"

  vim.cmd [[
    let g:airline#extensions#tabline#buffers_label = fnamemodify(getcwd(), ':t')
  ]]
end

return Plugin
