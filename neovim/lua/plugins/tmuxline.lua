local Plugin = {'edkolev/tmuxline.vim'}

Plugin.cmd = "Tmuxline"

function Plugin.init()
  vim.g['airline#extensions#tmuxline#enabled'] = 0
end

function Plugin.config()
  vim.g.tmuxline_preset = {
      a = '#S',
      win = {'#I', '#W'},
      cwin = {'#I', '#W'},
      x = '#(tmux-spotify-info)',
      y = {'#{battery_icon} #{battery_percentage} 󰘚 #{cpu_percentage} 󰍛 #{ram_percentage}', '%Y-%m-%d', '%R'},
      z = '#H',
      options = {
        ['status-justify'] = 'left'
      }
  }
end

return Plugin
