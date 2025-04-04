return {
  ---@type LazyPluginSpec
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      cmdline = {
        enabled = true,
        opts = {
          position = {
            row = "20%",
          },
        },
      },
      messages = { enabled = false },
      popupmenu = { enabled = true },
      hover = { enabled = false },
      signature = { enabled = false },
    },
  },
}
