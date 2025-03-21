require("neo-tree").setup({
  close_if_last_window = false,  -- 关闭最后一个窗口时自动关闭 NeoTree
  popup_border_style = "double", -- 可选：设置弹出窗口边框样式
  enable_git_status = true,      -- 启用 Git 状态显示
  enable_diagnostics = true,     -- 启用诊断信息显示
  default_component_configs = {
    container = {
      enable_character_fade = true,
    },
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    diagnostics = {
      symbols = {
        hint = "", -- 提示 (Hint)
        info = "", -- 信息 (Info)
        warn = "", -- 警告 (Warning)
        error = "", -- 错误 (Error)
      },
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        -- Change type
        added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = "✖", -- this can only be used in the git_status source
        renamed = "󰁕", -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored = "",
        unstaged = "󰄱",
        staged = "",
        conflict = "",
      },
    },
  },
})

-- 装饰线插件
require("ibl").setup()
