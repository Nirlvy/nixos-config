return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    build = "cargo build --release",
    opts = {
      keymap = {
        preset = "enter",
      },
      cmdline = {
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
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
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
