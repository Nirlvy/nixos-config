return {
  ---@type LazyPluginSpec
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    ---@module "noice"
    opts = {
      presets = {
        command_palette = true,
      },
      cmdline = {
        enabled = true,
        opts = {
          position = {
            row = '20%',
          },
        },
      },
      messages = { enabled = false },
      popupmenu = { enabled = true },
      notify = { enabled = false },
      hover = { enabled = false },
      lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
        messages = { enabled = false },
      },
    },
  },
}
