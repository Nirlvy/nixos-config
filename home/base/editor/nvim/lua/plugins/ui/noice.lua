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
      -- views = {
      --   cmdline_popup = {
      --     position = {
      --       row = 5,
      --       col = '50%',
      --     },
      --     size = {
      --       width = 60,
      --       height = 'auto',
      --     },
      --   },
      --   popupmenu = {
      --     relative = 'editor',
      --     position = {
      --       row = 8,
      --       col = '50%',
      --     },
      --     size = {
      --       width = 60,
      --       height = 10,
      --     },
      --     border = {
      --       style = 'rounded',
      --       padding = { 0, 1 },
      --     },
      --     win_options = {
      --       winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
      --     },
      --   },
      -- },
      -- routes = {
      --   {
      --     filter = {
      --       event = 'msg_show',
      --       any = {
      --         { find = '%d+L, %d+B' },
      --         { find = '; after #%d+' },
      --         { find = '; before #%d+' },
      --         { find = 'fewer lines' },
      --       },
      --     },
      --     view = 'mini',
      --   },
      -- },
    },
    config = function(_, opts)
      if vim.o.filetype == 'lazy' then
        vim.cmd([[messages clear]])
      end
      require('noice').setup(opts)
    end,
  },
}
