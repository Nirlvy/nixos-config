return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>sf', '<cmd>FzfLua files<cr>', desc = 'File' },
      { '<leader>sF', '<cmd>FzfLua files cwd=/<cr>', desc = 'File(root)' },
      { '<leader>sg', '<cmd>FzfLua grep<cr>', desc = 'Grep' },
      { '<leader>sG', '<cmd>FzfLua grep cwd=/<cr>', desc = 'Grep(root)' },
      { '<leader>sl', '<cmd>FzfLua live_grep_native<cr>', desc = 'Live_grep' },
      { '<leader>sb', '<cmd>FzfLua buFfers<cr>', desc = 'Buffer' },
      { '<leader>so', '<cmd>FzfLua oldfiles<cr>', desc = 'Oldfiles' },
      { '<leader>sc', '<cmd>FzfLua commands<cr>', desc = 'Command' },
      { '<leader>sq', '<cmd>FzfLua quickfix<cr>', desc = 'Quickfix' },
      { '<leader>ca', '<cmd>FzfLua lsp_code_actions<cr>', desc = 'Code Action' },

      { 'grr', '<cmd>FzfLua lsp_references<cr>', desc = '[G]oto [R]eferences' },
      { 'gri', '<cmd>FzfLua lsp_implementations<cr>', desc = '[G]oto [I]mplementation' },
      { 'grd', '<cmd>FzfLua lsp_definitions<cr>', desc = '[G]oto [D]efinition' },
      { 'gO', '<cmd>FzfLua lsp_document_symbols<cr>', desc = 'Open Document Symbols' },
      { 'gW', '<cmd>FzfLua lsp_workspace_symbols<cr>', desc = 'Open Workspace Symbols' },
      { 'grt', '<cmd>FzfLua lsp_typedef<cr>', desc = '[G]oto [T]ype Definition' },
    },
    opts = {
      files = {
        previewer = 'bat',
        hidden = false,
        follow = true,
        fd_opts = [[--type f -L -E .cache -E .git -E node_modules --strip-cwd-prefix]],
      },
      grep = {
        rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -L '
          .. "-g '!{.git,node_modules,*lock*,target,.orbstack,.cache,.vscode,.rustup}' ",
      },
    },
  },
}
