return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      win = {
        height = { min = 6 },
      },
      spec = {
        { '<leader>b', group = 'Buffer' },
        { '<leader>s', group = 'Fzf' },
        { '<leader>g', group = 'Git' },
        { '<leader>q', group = 'Quit' },
        { '<leader>t', group = 'Neo-tree' },
        { '<leader>u', group = 'Ui' },
        { '<leader>x', group = 'Trouble' },
        { '<leader>c', group = 'Code' },
      },
    },
  },
}
