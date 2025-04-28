return {
  ---@type LazyPluginSpec
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    opts = {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'markdown',
        'markdown_inline',
        'nix',
        'python',
        'regex',
        'toml',
        'tsx',
        'typescript',
        'xml',
        'yaml',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<leader>cs',
          node_incremental = '<leader>ci',
          scope_incremental = '<leader>cI',
          node_decremental = '<leader>cd',
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  ---@type LazyPluginSpec
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      enable = true,
      mode = 'topline',
    },
  },
}
