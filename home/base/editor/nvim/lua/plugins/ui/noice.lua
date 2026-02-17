return {
  ---@type LazyPluginSpec
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      -- 'rcarriga/nvim-notify',
    },
    ---@module "noice"
    opts = {
      presets = {
        command_palette = true,
        -- bottom_search = true,
      },
      cmdline = {
        enabled = true,
        view = 'cmdline_popup',
        opts = {
          position = {
            row = '20%',
          },
        },
      },
      popupmenu = { enabled = true },
      notify = { enabled = false },
      lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
        messages = { enabled = false },
      },
      config = function(_, opts)
        if vim.o.filetype == 'lazy' then
          vim.cmd([[messages clear]])
        end
        require('noice').setup(opts)
      end,
    },
  },
}
