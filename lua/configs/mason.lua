require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",

    "html",
    "cssls",
    "tailwindcss",
    "eslint",

    "ruff",
  },
}

local nvchad_defaluts = require("nvchad.configs.lspconfig")
require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      on_attach = nvchad_defaluts.on_attach,
      capabilities = nvchad_defaluts.capabilities,
      on_init = nvchad_defaluts.on_init,
    }
  end,
}
