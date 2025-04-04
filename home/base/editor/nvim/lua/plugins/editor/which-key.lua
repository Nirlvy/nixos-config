return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      win = {
        height = { min = 6 },
      },
      spec = {
        {
          "<leader>b",
          group = "Buffer",
        },
        {
          "<leader>f",
          group = "Fzf",
        },
        {
          "<leader>g",
          group = "Git",
        },
        { "<leader>q", group = "Quit" },
        { "<leader>t", group = "Neo-tree" },
        { "<leader>s", group = "Select Node" },
        { "<leader>u", group = "Ui" },
        { "<leader>x", group = "Trouble" },
        { "<leader>c", group = "Code" },
      },
    },
  },
}
