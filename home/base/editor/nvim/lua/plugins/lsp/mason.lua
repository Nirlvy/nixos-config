return {
  --- @type LazyPluginSpec
  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = {
      PATH = "append",
    },
  },
  --- @type LazyPluginSpec
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "Filetype" },
    opts = {
      ensure_installed = {
        "css-lsp",
        "lua-language-server",
        "json-lsp",

        "prettier",
        "stylua",
      },
      auto_update = true,
    },
  },
}
