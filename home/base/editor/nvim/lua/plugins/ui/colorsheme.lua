return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "frappe",
      integrations = {
        blink_cmp = true,
      },
    },
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
