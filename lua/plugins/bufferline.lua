vim.opt.termguicolors = true
-- :h bufferline-highlights
require("bufferline").setup {
  options = {
    -- 使用 nvim 内置lsp
    diagnostics = "nvim_lsp",
    -- 左侧让出 nvim-tree 的位置
    offsets = { {
      filetype = "neo-tree", -- 另一个窗口类型，举例为 NeoTree
      text = "Explorer",     -- 标题
      text_align = "center", -- 文字居中
      padding = 2,           -- 偏移量
    } }
  },
  highlights = {
    fill = {
      fg = '#212436',
      bg = '#212436',
    },
    buffer_selected = {
      fg = "#FFFFFF", -- 选中的缓冲区字体颜色
      bg = "#000080", -- 选中的缓冲区背景颜色
      bold = true,    -- 加粗选中的缓冲区
    },
    -- separator = {
    --   fg = "#01FF40", -- 分隔线颜色
    --   bg = "#01FF40", -- 分隔线背景颜色
    -- },
  }

}
