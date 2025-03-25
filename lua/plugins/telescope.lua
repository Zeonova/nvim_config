local builtin = require("telescope.builtin")
-- 项目切换函数
local function switch_project(project_path)
	-- 切换 Vim 工作目录
	vim.fn.chdir(project_path)

	-- 使用 Neotree 打开项目目录
	pcall(function()
		require("neo-tree.command").execute({
			action = "show",
			dir = project_path,
		})
	end)

	-- 可选：发送通知
	vim.notify("Switched to project: " .. project_path, vim.log.levels.INFO)
end
-- Telescope 项目扩展配置
pcall(require("telescope").load_extension, "projects")
require("telescope").load_extension("todo-comments")

require("telescope").setup({
	defaults = {
		cwd = vim.fn.getcwd(),
		file_ignore_patterns = {
			"^.git/",
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
		project = {
			base_dirs = {
				"~/Code",
			},
			ignore_missing_dirs = true, -- default: false
			hidden_files = true, -- default: false
			theme = "dropdown",
			order_by = "asc",
			search_by = "title",

			on_project_selected = function(prompt_bufnr)
				local action_state = require("telescope.actions.state")
				local selected_project = action_state.get_selected_entry()

				-- 关闭 Telescope 窗口
				require("telescope.actions").close(prompt_bufnr)

				if selected_project and selected_project.path then
					switch_project(selected_project.path)
				end
			end,
		},
	},
})
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

-- 快捷键映射
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { noremap = true, silent = true })

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
