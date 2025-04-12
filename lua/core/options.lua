local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99 -- 默认展开所有折叠
opt.foldenable = true
-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.winbar = "%=%m %t" -- 只显示文件名

opt.termguicolors = true
opt.signcolumn = "yes"

opt.spell = true
opt.spelllang = { "en_us" }

opt.makeprg = "checkmake"

vim.cmd([[colorscheme tokyonight-moon]])
