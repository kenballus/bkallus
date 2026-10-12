vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.mouse = ""
vim.cmd.colorscheme("vim")
vim.bo.eol = false

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function()
    vim.lsp.start({
      name = 'rust-analyzer',
      cmd = { 'rust-analyzer' },
      root_dir = vim.fs.dirname(vim.fs.find({ 'Cargo.toml', '.git' }, { upward = true })[1]),
    })
  end,
})
