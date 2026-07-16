return {
  ---@type LazyPluginSpec
  {
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    build = function()
      require('blink.cmp').build():pwait()
    end,
    dependencies = {
      {
        'saghen/blink.lib',
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        build = 'make install_jsregexp',
        dependencies = {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip').config.setup({ enable_autosnippets = true })
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
        opts = {
          history = true,
          delete_check_events = 'TextChanged',
        },
      },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'enter',
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
      },
      cmdline = {
        completion = { menu = { auto_show = true } },
        keymap = {
          ['<C-k>'] = { 'select_prev', 'fallback' },
          ['<C-j>'] = { 'select_next', 'fallback' },
        },
      },
      completion = {
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
        menu = {
          draw = {
            columns = {
              { 'label',     'label_description', gap = 1 },
              { 'kind_icon', 'kind' },
            },
            treesitter = { 'lsp' },
          },
        },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'omni' },
        per_filetype = {
          lua = { inherit_defaults = true, 'lazydev' }
        },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
          lsp = {
            name = 'LSP',
            module = 'blink.cmp.sources.lsp',
          },
          buffer = {
            opts = {
              get_bufnrs = function()
                return vim.tbl_filter(function(bufnr)
                  return vim.bo[bufnr].buftype == ''
                end, vim.api.nvim_list_bufs())
              end,
            },
          },
        },
      },
      signature = { enabled = true },
      snippets = { preset = 'luasnip' },
    },
    opts_extend = { 'sources.default' },
  },
}
