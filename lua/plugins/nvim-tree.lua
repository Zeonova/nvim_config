require("neo-tree").setup({
  default_component_configs = {
    diagnostics = {
      symbols = {
        hint = "", -- 提示 (Hint)
        info = "", -- 信息 (Info)
        warn = "", -- 警告 (Warning)
        error = "", -- 错误 (Error)
      },
    },
  },
})

-- 装饰线插件
require("ibl").setup()
