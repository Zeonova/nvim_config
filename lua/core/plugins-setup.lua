-- 自动安装packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("folke/tokyonight.nvim") -- 主题
	use({
		"nvim-lualine/lualine.nvim", -- 状态栏
		requires = { "nvim-tree/nvim-web-devicons" }, -- 状态栏图标
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		}, -- Optional image support in preview window: See `# Preview Mode` for more information
	})
	use("christoomey/vim-tmux-navigator") -- 用ctl-hjkl来定位窗口
	use("nvim-treesitter/nvim-treesitter") -- 语法高亮
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
		"neovim/nvim-lspconfig",
	})
	use({
		"nvimtools/none-ls.nvim",
		requires = {
			"nvimtools/none-ls-extras.nvim",
		},
	})
	-- 自动补全
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip") -- snippets引擎，不装这个自动补全会出问题
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("hrsh7th/cmp-path") -- 文件路径
	use("hrsh7th/cmp-omni")
	use("f3fora/cmp-spell")

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					toml = { "taplo" }, -- 为 toml 文件使用 taplo 格式化
					rust = { "rustfmt", lsp_format = "fallback" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	})

	use("folke/todo-comments.nvim")

	-- AI
	use({
		"yetone/avante.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
			"zbirenbaum/copilot.lua",
		},
		branch = "main",
		run = "make",
	})

	use("numToStr/Comment.nvim") -- gcc和gc注释
	use("windwp/nvim-autopairs") -- 自动补全括号

	use("akinsho/bufferline.nvim") -- buffer分割线
	use("lewis6991/gitsigns.nvim") -- 左则git提示

	use("folke/trouble.nvim")
	use("folke/flash.nvim")
	use("j-hui/fidget.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8", -- 文件检索
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({
		"folke/noice.nvim",
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	})

	use("chentoast/marks.nvim")

	use("folke/which-key.nvim")

	-- test
	use({
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
				default_shift_tab = "<C-d>", -- reverse shift default action,
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
		wants = { "nvim-treesitter" }, -- (optional) or require if not used so far
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	})

	use({
		"nvimdev/dashboard-nvim",

		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use({
		"nvim-telescope/telescope-project.nvim",
		requires = { "nvim-telescope/telescope.nvim", "ahmedkhalf/project.nvim" },
	})
	if packer_bootstrap then
		require("packer").sync()
	end
end)
