require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",

  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}
require 'lspconfig'.rust_analyzer.setup {
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
}
