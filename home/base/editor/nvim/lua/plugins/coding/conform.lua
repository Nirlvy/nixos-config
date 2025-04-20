return {
  --- @type LazyPluginSpec
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>bf",
        function()
          require("conform").format({ async = true })
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        cpp = { "clang_format" },
        css = { "prettier" },
        lua = { "stylua" },
        nix = { "nixfmt" },
        json = { "prettier" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      notify_on_error = true,
      notify_no_formatters = true,
      formatters = {
        nixfmt = {
          prepend_args = { "-s" },
        },
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
