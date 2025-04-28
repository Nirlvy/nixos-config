return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      { 'j-hui/fidget.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    event = { 'Filetype' },
    opts = {
      servers = {
        clangd = {},
        cssls = {},
        lua_ls = {},
        jsonls = {},
        taplo = {},
        nixd = {},
        pyright = {
          cmd = { 'delance-langserver', '--stdio' },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
}
