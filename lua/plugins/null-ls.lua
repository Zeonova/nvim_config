local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.biome,
		require("none-ls.formatting.jq"),
		require("none-ls.code_actions.eslint"),
	},
})

-- custom diagnostics
local hello_hit = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = {},
	generator = {
		fn = function(params)
			local diagnostics = {}
			-- sources have access to a params object
			-- containing info about the current file and editor state
			for i, line in ipairs(params.content) do
				local col, end_col = line:find("hello")
				if col and end_col then
					-- null-ls fills in undefined positions
					-- and converts source diagnostics into the required format
					table.insert(diagnostics, {
						row = i,
						col = col,
						end_col = end_col + 1,
						source = "hello_hit",
						message = "Hello from null_ls,this is test message.",
						severity = vim.diagnostic.severity.HINT,
					})
				end
			end
			return diagnostics
		end,
	},
}

local function create_diagnostic_rule(pattern, message, severity, filetypes)
	return {
		method = null_ls.methods.DIAGNOSTICS,
		filetypes = filetypes or {},
		generator = {
			fn = function(params)
				local diagnostics = {}
				local vim_regex = vim.regex(pattern)

				for i, line in ipairs(params.content) do
					local start_pos, end_pos = vim_regex:match_str(line)

					if start_pos then
						start_pos = vim.str_byteindex(line, start_pos) + 1
						end_pos = vim.str_byteindex(line, end_pos) + 1
						table.insert(diagnostics, {
							row = i,
							col = start_pos,
							end_col = end_pos,
							source = "custom diagnostic rule from vim_regex",
							message = message, -- 使用动态的 message
							severity = severity or vim.diagnostic.severity.INFO,
						})
					end
				end
				return diagnostics
			end,
		},
	}
end
local SPELLING_WORDS = { "<scr>", "flie", "teh", "adn" }
local pattern = [[\v(]] .. table.concat(SPELLING_WORDS, "|") .. [[)]]

local spells_rule = create_diagnostic_rule(pattern, "Hint: Possible spelling error.")

-- Rust --

local RUST_SPELLING_WORDS = { "([&*#:_])@<!mut self" }
local rust_pattern = [[\v(]] .. table.concat(RUST_SPELLING_WORDS, "|") .. [[)]]

local rust_w_rule = create_diagnostic_rule(
	rust_pattern,
	"Warning: Note that ‘mut self’ does not have ‘&’.",
	vim.diagnostic.severity.WARN,
	{ "rust" }
)

null_ls.register({ hello_hit, rust_w_rule, spells_rule })
