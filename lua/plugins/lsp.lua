require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- 允许 `vim` 关键字
      },
      telemetry = { enable = false },
    },
  },
})
require("lspconfig").rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = { -- 配置自动补全、建议等
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      cargo = {
        allFeatures = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
require("lspconfig").html.setup({
  capabilities = capabilities,
  settings = {
    html = {
      format = {
        enable = true, -- 启用格式化
      },
      diagnostics = {
        enable = true, -- 启用诊断
      },
      css = {
        enable = true, -- 启用 CSS 支持
      },
      javascript = {
        enable = true, -- 启用 JavaScript 支持
      },
      suggest = {
        html5 = true, -- 启用 HTML5 标签建议
      },
    },
  },
})
require("lspconfig").ts_ls.setup({
  capabilities = capabilities,
  settings = {
    javascript = {
      format = {
        enable = true, -- 启用格式化
      },
      validate = {
        enable = true, -- 启用验证
      },
    },
    typescript = {
      format = {
        enable = true, -- 启用格式化
      },
      validate = {
        enable = true, -- 启用验证
      },
    },
  },
})
