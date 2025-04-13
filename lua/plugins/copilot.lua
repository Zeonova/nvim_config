-- vim.api.nvim_set_keymap("i", "<C-\\>", "<Plug>(copilot-dismiss)", { silent = true })
require("copilot").setup({
	enabled = true,
	auto_trigger = true,
	debounce = 150,
	copilot_model = "claude-3.7-sonnet",
	server_opts_overrides = {
		offset_encoding = "utf-16",
		trace = "verbose",
		settings = {
			advanced = {
				listCount = 10,
				inlineSuggestCount = 3,
			},
		},
	},
})

require("avante").setup({
	provider = "copilot",
	auto_suggestions_provider = "copilot",
	copilot = {
		model = "claude-3.7-sonnet",
	},
	behaviour = {
		auto_suggestions = true,
	},
	mappings = {
		diff = {
			ours = "co",
			theirs = "ct",
			all_theirs = "ca",
			both = "cb",
			cursor = "cc",
			next = "]x",
			prev = "[x",
		},
		suggestion = {
			accept = "<M-l>",
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-\\>",
		},
		submit = {
			normal = "<CR>",
			insert = "<C-s>",
		},
		cancel = {
			normal = { "<C-c>", "<Esc>", "q" },
			insert = { "<C-c>" },
		},
		sidebar = {
			apply_all = "A",
			apply_cursor = "a",
			retry_user_request = "r",
			edit_user_request = "e",
			switch_windows = "<Tab>",
			remove_file = "d",
			add_file = "@",
			close = { "<Esc>", "q" },
		},
	},
	windows = {
		position = "right", -- 侧边栏位置
		width = 30,
		wrap = true,
	},
	-- 文件选择器配置
	file_selector = {
		provider = "telescope", -- 可选择 "native", "fzf", "mini.pick", "telescope"
	},
})
