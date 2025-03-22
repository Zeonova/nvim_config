---@diagnostic disable: undefined-field
vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "取消高亮" })

-- 切换buffer
keymap.set("n", "<S-L>", ":bnext<CR>")
keymap.set("n", "<S-H>", ":bprevious<CR>")

-- ---------- 插件 ---------- ---
-- ntree
keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

-- 全部退出
keymap.set("n", "<leader>qa", ":qa<CR>", { desc = "退出所有窗口" })

-- 全部保存后退出
keymap.set("n", "<leader>qw", ":wa | qa<CR>", { desc = "保存所有文件并退出" })

keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "关闭当前 Buffer" })
keymap.set("n", "<leader>bb", ":bnext<CR>", { desc = "Switch Buffer(Just next)" })
keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "关闭其他 Buffer" })

-- 打开/关闭 Trouble
keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
keymap.set(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix List (Trouble)" })

-- Flash 插件快捷键配
keymap.set("n", "<leader>s", function()
	require("flash").jump()
end, { desc = "Flash" })
keymap.set("n", "<leader>S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
-- keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
-- keymap.set("o", "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
-- keymap.set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

-- Code Action
keymap.set(
	"n",
	"<leader>ca",
	"<cmd>lua vim.lsp.buf.code_action()<CR>",
	{ desc = "触发代码操作（Code Action）" }
)
-- Todo Comment
keymap.set("n", "<leader>tf", "<CMD>TodoTelescope keywords=TODO,FIX<CR>", { desc = "Toggle Todo Telescope" })
-- 在 Trouble 中列出所有 TODO
keymap.set("n", "<leader>tt", function()
	-- 如果窗口已打开，则关闭；否则打开
	local trouble = require("trouble")
	if trouble.is_open() then
		trouble.close()
	else
		vim.cmd("Trouble todo")
	end
end, { desc = "Toggle Todo Trouble" })

keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "跳转到定义" })
keymap.set("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "查看文档" })
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "跳转到引用" })
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "跳转到类型定义" })
keymap.set("n", "<leader>grn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "重命名符号" })
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "跳转到实现" })
keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "查看签名帮助" })
-- keymap.set("n", "<leader>oi", "<cmd>lua vim.lsp.buf.organize_imports()<CR>", { desc = "整理导入" })
keymap.set("n", "<leader>rr", "<C-o>", { desc = "回退光标" })

-- Marks
vim.keymap.set("n", "<leader>mm", function()
	---@diagnostic disable-next-line: undefined-field
	require("marks").set_next()
end, { desc = "Set the next available mark" })

vim.keymap.set("n", "<leader>mt", function()
	require("marks").toggle()
end, { desc = "Toggle the next available mark" })

vim.keymap.set("n", "<leader>mn", function()
	require("marks").next()
end, { desc = "Move to next mark" })

-- 删除书签的相关操作
vim.keymap.set("n", "<leader>mc", function()
	require("marks").delete_buf()
end, { desc = "Delete all marks in the current buffer" })

vim.keymap.set("n", "<leader>md", function()
	require("marks").delete_line()
end, { desc = "Delete the bookmark under the cursor" })

-- TestFunction
vim.keymap.set(
	"n",
	"<leader>it",
	':!osascript -e "tell application \\"iTerm\\" to create window with default profile"\n',
	{ desc = "Open new iTerm2 window" }
) -- whick-key grouping
--
require("which-key").add({
	{ "<leader>w", proxy = "<C-w>", group = "windows" },
	{ "<leader>f", group = "Telescope" }, -- group
	{ "<leader>g", group = "Code" }, -- group
	{ "<leader>m", group = "Marks" }, -- group
})
