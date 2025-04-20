return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    event = { "Filetype" },
    opts = {
      servers = {
        clangd = {},
        cssls = {},
        lua_ls = {},
        jsonls = {},
        nixd = {},
        pyright = {
          cmd = { "delance-langserver", "--stdio" },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
}
