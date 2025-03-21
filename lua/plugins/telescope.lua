local builtin = require('telescope.builtin')

-- telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "查找文件" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "实时 grep 搜索（需要安装 ripgrep）" }) -- 环境里要安装ripgrep
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "列出打开的缓冲区" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "搜索帮助标签" })
