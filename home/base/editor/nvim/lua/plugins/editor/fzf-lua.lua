return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "fzf file" },
      { "<leader>fF", "<cmd>FzfLua files cwd=/<cr>", desc = "fzf file(root)" },
      { "<leader>fg", "<cmd>FzfLua grep<cr>", desc = "fzf grep" },
      { "<leader>fG", "<cmd>FzfLua grep cwd=/<cr>", desc = "fzf grep(root)" },
      { "<leader>fl", "<cmd>FzfLua live_grep_native<cr>", desc = "fzf live_grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "fzf buffer" },
      { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "fzf oldfiles" },
      { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "fzf command" },
      { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "fzf quickfix" },
      { "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", desc = "fzf code action" },
    },
    opts = {
      files = {
        follow = true,
        fd_opts = [[--type f -L -E .cache -E .git -E node_modules --strip-cwd-prefix]],
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -L "
          .. "-g '!{.git,node_modules,*lock*,target,.orbstack,.cache,.vscode,.rustup}' ",
      },
    },
  },
}
