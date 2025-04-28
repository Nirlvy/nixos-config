return {
  ---@type LazyPluginSpec
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {
      modes = { insert = true, command = true, terminal = false },
    },
  },
  ------@type LazyPluginSpec
  ---{
  ---  "windwp/nvim-autopairs",
  ---  event = "InsertEnter",
  ---  opts = {},
  ---},
}
