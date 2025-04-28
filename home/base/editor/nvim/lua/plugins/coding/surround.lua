return {
  {
    'echasnovski/mini.surround',
    event = 'InsertEnter',
    opts = {
      mappings = {
        add = '<leader>cSa', -- Add surrounding in Normal and Visual modes
        delete = '<leader>cSd', -- Delete surrounding
        find = '<leader>cSf', -- Find surrounding (to the right)
        find_left = '<leader>cSF', -- Find surrounding (to the left)
        highlight = '<leader>cSh', -- Highlight surrounding
        replace = '<leader>cSr', -- Replace surrounding
        update_n_lines = '<leader>cSn', -- Update `n_lines`
      },
    },
  },
}
