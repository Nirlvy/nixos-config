return {
  --- @type LazyPluginSpec
  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
    },
    --- @class MasonSettings
    opts = {
      PATH = "append",
      registries = {
        "github:mason-org/mason-registry",
        "github:nirlvy/mason-registry",
      },
    },
  },
  --- @type LazyPluginSpec
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "Filetype" },
    opts = {
      ensure_installed = {
        "css-lsp",
        "delance-runtime",
        "lua-language-server",
        "json-lsp",

        "prettier",
        "stylua",
      },
      auto_update = true,
    },
  },
}
