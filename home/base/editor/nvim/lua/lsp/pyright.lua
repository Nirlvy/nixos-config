---@type vim.lsp.Config
return {
  cmd = {
    'delance-langserver',
    '--stdio',
  },
  filetypes = { 'python' },
}
