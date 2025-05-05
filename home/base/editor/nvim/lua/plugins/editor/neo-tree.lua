return {
  ---@type LazyPluginSpec
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
  ---@type LazyPluginSpec
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      -- {
      --   's1n7ax/nvim-window-picker',
      --   opts = {
      --     filter_rules = {
      --       include_current_win = false,
      --       autoselect_one = true,
      --       bo = {
      --         filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
      --         buftype = { 'terminal', 'quickfix' },
      --       },
      --     },
      --   },
      -- },
    },
    lazy = false,
    cmd = 'Neotree',
    keys = {
      {
        '<leader>tt',
        function()
          require('neo-tree.command').execute({
            source = 'filesystem',
            toggle = true,
          })
        end,
        desc = 'File Explorer',
      },
      { '\\', '<cmd>Neotree reveal<CR>', desc = 'Neotree reveal', silent = true },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup('Neotree_start_directory', {
          clear = true,
        }),
        desc = 'Start Neo-tree with directory',
        once = true,
        callback = function()
          if package.loaded['neo-tree'] then
            return
          else
            ---@diagnostic disable-next-line: param-type-mismatch
            local stats = vim.uv.fs_stat(vim.fn.argv(0))
            if stats and stats.type == 'directory' then
              require('neo-tree')
            end
          end
        end,
      })
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = '*',
        callback = function()
          if vim.fn.winnr('$') == 1 and vim.bo.filetype == 'neo-tree' then
            vim.cmd('quit')
          end
        end,
      })
    end,
    ---@module "neo-tree"
    ---@type neotree.Config
    opts = {
      sources = { 'filesystem' },
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        position = 'left',
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['<space>'] = 'none',
          ['w'] = 'none',
        },
      },
    },
  },
}
