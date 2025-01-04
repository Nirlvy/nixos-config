return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      win = {
        height = { min = 6, max = 25 },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps",
      },
      {
        "<leader>f",
        function()
          require("which-key").show({ global = true })
        end,
        desc = "fzf",
      },
    },
  },
}
