-- Trouble
local trouble = require("trouble")

trouble.setup {
  position = "bottom", -- 可选: "top", "bottom", "left", "right"
  height = 10,         -- 仅当 position 为 "top" 或 "bottom" 时有效
  width = 50,          -- 仅当 position 为 "left" 或 "right" 时有效
  use_diagnostic_signs = true
}
