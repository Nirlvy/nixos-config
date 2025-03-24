return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    build = "cargo build --release",
    opts = {
      keymap = {
        preset = "enter",
      },
      cmdline = {
        completion = {
          menu = {
            auto_show = true,
          },
        },
        keymap = {
          ["<C-y>"] = { "select_and_accept" },
          ["<cr>"] = { "fallback" },
          ["<C-p>"] = { "select_prev", "fallback" },
          ["<C-n>"] = { "select_next", "fallback" },
        },
      },

      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = { auto_show = true },
        ghost_text = {
          enabled = true,
        },
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          lsp = {
            name = "LSP",
            module = "blink.cmp.sources.lsp",
          },
          buffer = {
            opts = {
              get_bufnrs = function()
                return vim.tbl_filter(function(bufnr)
                  return vim.bo[bufnr].buftype == ""
                end, vim.api.nvim_list_bufs())
              end,
            },
          },
        },
      },
      signature = {
        enabled = true,
      },
      snippets = { preset = "luasnip" },
    },
    opts_extend = { "sources.default" },
  },
}
