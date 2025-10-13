require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",

    "html",
    "cssls",
    "tailwindcss",

    "ts_ls",
    -- "biome",
    -- "eslint",

    "pylsp",
    -- "pyrefly",

    "clangd",

    "jqls",
  },
  automatic_enable = true,
}

local nvchad_defaults = require "nvchad.configs.lspconfig"

-- Custom configuration for pylsp using the new vim.lsp.config API
vim.lsp.config("pylsp", {
  on_attach = nvchad_defaults.on_attach,
  capabilities = nvchad_defaults.capabilities,
  on_init = nvchad_defaults.on_init,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        pylint = { enabled = false },
        flake8 = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        ruff = {
          enabled = true, -- Enable the plugin
          formatEnabled = true, -- Enable formatting using ruffs formatter
          extendSelect = { "I" }, -- Rules that are additionally used by ruff
          format = { "I" }, -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
        },
      },
    },
  },
})

vim.lsp.config("biome", {
  on_attach = function(client, bufnr)
    nvchad_defaults.on_attach(client, bufnr)

    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    print("Biome LSP attached from: " .. (client.config.cmd and table.concat(client.config.cmd, " ") or "unknown"))
  end,
  capabilities = nvchad_defaults.capabilities,
  on_init = nvchad_defaults.on_init,

  single_file_support = false,
})

-- For other servers, use the wildcard to apply default settings
vim.lsp.config("*", {
  on_attach = nvchad_defaults.on_attach,
  capabilities = nvchad_defaults.capabilities,
  on_init = nvchad_defaults.on_init,
})
