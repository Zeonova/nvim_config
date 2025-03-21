vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
-- keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "水平新增窗口" }) -- 水平新增窗口
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "垂直新增窗口" }) -- 垂直新增窗口
keymap.set("n", "<leader>wq", ":q<CR>", { desc = "关闭当前窗口" })

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "取消高亮" })

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

-- ---------- 插件 ---------- ---
-- ntree
keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

-- 全部退出
keymap.set("n", "<leader>qa", ":qa<CR>", { desc = "退出所有窗口" })

-- 全部保存后退出
keymap.set("n", "<leader>qw", ":wa | qa<CR>", { desc = "保存所有文件并退出" })

-- 关闭当前 buffer
keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "关闭当前 Buffer" })

-- 关闭其他 buffer
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
