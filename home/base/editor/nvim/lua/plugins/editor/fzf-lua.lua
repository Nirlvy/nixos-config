return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = "VeryLazy",
    keys = {
      { "<leader>ff", ":lua require('fzf-lua').files()<CR>", desc = "fzf file" },
      { "<leader>fg", ":lua require('fzf-lua').grep()<CR>", desc = "fzf grep" },
      { "<leader>fb", ":lua require('fzf-lua').buffers()<CR>", desc = "fzf buffer" },
      { "<leader>fr", ":lua require('fzf-lua').oldfiles()<CR>", desc = "fzf oldfiles" },
      { "<leader>fc", ":lua require('fzf-lua').commands()<CR>", desc = "fzf command" },
    },
  },
}
