return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "fzf file" },
      { "<leader>fg", "<cmd>FzfLua grep<cr>", desc = "fzf grep" },
      { "<leader>fl", "<cmd>FzfLua live_grep<cr>", desc = "fzf live_grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "fzf buffer" },
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "fzf oldfiles" },
      { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "fzf command" },
      { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "fzf quickfix" },

      { "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", desc = "fzf code action" },
    },
  },
}
