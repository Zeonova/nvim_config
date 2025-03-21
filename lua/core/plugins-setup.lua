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
	-- 自动补全
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip") -- snippets引擎，不装这个自动补全会出问题
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("hrsh7th/cmp-path") -- 文件路径

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				}, -- 自定义 UI 提示（需安装 nvim-notify）
			})
		end,
	})

	use("folke/todo-comments.nvim")

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
	use("folke/which-key.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
