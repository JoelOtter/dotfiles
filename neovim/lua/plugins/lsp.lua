local Plugin = { 'neovim/nvim-lspconfig' }

Plugin.lazy = false

Plugin.dependencies = {
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'williamboman/mason-lspconfig.nvim' },
}

function Plugin.config()
  local lspconfig = require('lspconfig')
  local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
  local default_setup = function(server)
    lspconfig[server].setup({
      capabilities = lsp_capabilities,
    })
  end

  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = { default_setup },
  })
  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function()
      local bufmap = function(mode, lhs, rhs)
        local opts = { buffer = true }
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- Displays hover information about the symbol under the cursor
      bufmap('n', '<Leader>ll', '<cmd>lua vim.lsp.buf.hover()<cr>')

      -- Jump to the definition
      bufmap('n', '<Leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>')

      -- Jump to declaration
      bufmap('n', '<Leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

      -- Lists all the implementations for the symbol under the cursor
      bufmap('n', '<Leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>')

      -- Jumps to the definition of the type symbol
      bufmap('n', '<Leader>lo', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

      -- Lists all the references
      bufmap('n', '<Leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>')

      -- Displays a function's signature information
      bufmap('n', '<Leader>lt', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

      -- Renames all references to the symbol under the cursor
      bufmap('n', '<Leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>')

      -- Selects a code action available at the current cursor position
      bufmap('n', '<Leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')

      -- Show diagnostics in a floating window
      bufmap('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<cr>')

      -- Move to the previous diagnostic
      bufmap('n', '<Leader>[', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

      -- Move to the next diagnostic
      bufmap('n', '<Leader>]', '<cmd>lua vim.diagnostic.goto_next()<cr>')

      -- Format
      bufmap({ 'n', 'v' }, '<Leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>')
    end
  })
end

return Plugin
