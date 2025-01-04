---@type Lazy
return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    build = "cargo build --release",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "enter",
        cmdline = {
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
        ghost_text = {
          enabled = true,
        },
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer", "luasnip" },
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
      snippets = {
        expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require("luasnip").jumpable(filter.direction)
          end
          return require("luasnip").in_snippet()
        end,
        jump = function(direction)
          require("luasnip").jump(direction)
        end,
      },
    },
    opts_extend = { "sources.default" },
  },
}
