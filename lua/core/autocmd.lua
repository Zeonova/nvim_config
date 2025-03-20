-- 自动格式化保存时触发
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "lua vim.lsp.buf.format()",
})


vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  command = "set nohlsearch",
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set hlsearch",
})
