return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      cmdline = { enabled = true },
      messages = { enabled = false },
      popmenu = { enabled = false },
      redirect = { enabled = false },
    },
  },
}
