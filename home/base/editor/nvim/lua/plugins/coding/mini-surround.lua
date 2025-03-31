return {
  {
    "echasnovski/mini.surround",
    event = "InsertEnter",
    opts = {
      mappings = {
        add = "cSa", -- Add surrounding in Normal and Visual modes
        delete = "cSd", -- Delete surrounding
        find = "cSf", -- Find surrounding (to the right)
        find_left = "cSF", -- Find surrounding (to the left)
        highlight = "cSh", -- Highlight surrounding
        replace = "cSr", -- Replace surrounding
        update_n_lines = "cSn", -- Update `n_lines`
      },
    },
  },
}
