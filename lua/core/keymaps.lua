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
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "水平新增窗口" }) -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "垂直新增窗口" }) -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "取消高亮" })

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")


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
keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
  { desc = "Buffer Diagnostics (Trouble)" })
keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
  { desc = "LSP Definitions / references / ... (Trouble)" })
keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix List (Trouble)" })
