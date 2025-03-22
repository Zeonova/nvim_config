local builtin = require("telescope.builtin")

-- telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "查找文件" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "实时 grep 搜索（需要安装 ripgrep）" }) -- 环境里要安装ripgrep
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "列出打开的缓冲区" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "搜索帮助标签" })
vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "查看寄存器" })
vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "查看跳转历史" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "查看快捷键映射" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "查看书签" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "查看历史文件" })

vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "查看函数定义" })
vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "查看类型定义" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "查看文档中的符号" })
vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "查看工作区符号" })

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
})
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
