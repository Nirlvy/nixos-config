return {
  ---@type LazyPluginSpec
  {
    "lewis6991/gitsigns.nvim",
    event = "InsertEnter",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
}
