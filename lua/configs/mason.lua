require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    -- "stylua",

    "html",
    "cssls",
    "tailwindcss",
    "ts_ls",
    "eslint",
    "biome",

    "pylsp",

    -- "clang-format",
    "clangd",
  },
}

local nvchad_defaults = require "nvchad.configs.lspconfig"
local custom_handlers = {
  pylsp = function()
    require("lspconfig").pylsp.setup {
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
    }
  end,
}

require("mason-lspconfig").setup_handlers {
  function(server_name)
    if custom_handlers[server_name] then
      custom_handlers[server_name]()
    else
      require("lspconfig")[server_name].setup {
        on_attach = nvchad_defaults.on_attach,
        capabilities = nvchad_defaults.capabilities,
        on_init = nvchad_defaults.on_init,
      }
    end
  end,
}
