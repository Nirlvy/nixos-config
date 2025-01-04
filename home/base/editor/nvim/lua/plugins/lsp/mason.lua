return {
  {
    "williamboman/mason.nvim",
    {
      "williamboman/mason-lspconfig.nvim",
    },
    cmd = "Mason",
    keys = {
      { "<leader>m", "<cmd>Mason<cr>", desc = "open mason" },
    },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      PATH = "append",
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
  },
}
