local Plugin = { 'mfussenegger/nvim-dap' }

Plugin.dependencies = {
  { 'rcarriga/nvim-dap-ui' }
}

Plugin.keys = {
  { '<Leader>bb', ':DapToggleBreakpoint<CR>' },
  { '<Leader>bc', ':DapContinue<CR>' },
  { '<Leader>bs', ':lua require"dap".step_over()<CR>' },
  { '<Leader>bu', ':lua require"dapui".toggle()<CR>' },
}

function Plugin.config()
  local dap = require('dap')
  local dapui = require('dapui')
  dapui.setup()

  local codelldbPort = 13000

  dap.adapters.codelldb = {
    type = 'server',
    port = codelldbPort,
    executable = {
      command = vim.fn.stdpath 'data' .. '/mason/packages/codelldb/extension/adapter/codelldb',
      args = { "--port", codelldbPort }
    }
  }

  dap.configurations.cpp = {
    {
      name = 'Launch lldb',
      type = 'codelldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      args = function()
        return vim.split(vim.fn.input('Arguments: ', '', 'file'), ' ')
      end,
      stopOnEntry = false,
      -- Breaks on all exceptions by default, yuck.
      preRunCommands = { 'breakpoint name configure --disable cpp_exception' }
    }
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.objc = dap.configurations.cpp

  dap.listeners.after.event_initialized["dapui_config"] = dapui.open
  dap.listeners.before.event_terminated["dapui_config"] = dapui.close
  dap.listeners.before.event_exited["dapui_config"] = dapui.close
end

return Plugin
