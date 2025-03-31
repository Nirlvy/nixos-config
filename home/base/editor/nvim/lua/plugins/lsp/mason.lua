return {
  {
    "williamboman/mason.nvim",
    enabled = false,
    keys = {
      { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = false,
    event = {
      "Filetype",
    },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_installation = true,
      ensure_installed = {},
    },
  },
}
