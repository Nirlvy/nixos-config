local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  defaults = {
    lazy = false,
    version = false,
  },
  spec = {
    { import = 'plugins' },
  },
  checker = { enabled = false },
  rocks = { enabled = false },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
        'editorconfig',
        'gzip',
        'man',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'osc52',
        'rplugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

require('config.autocmds')
require('config.keymaps')
require('config.options')
