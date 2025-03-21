-- Trouble
local trouble = require("trouble")

trouble.setup {
  position = "bottom", -- 可选: "top", "bottom", "left", "right"
  height = 10,         -- 仅当 position 为 "top" 或 "bottom" 时有效
  width = 50,          -- 仅当 position 为 "left" 或 "right" 时有效
  use_diagnostic_signs = true
}


require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,       -- add a border to hover docs and signature help
  },
})
