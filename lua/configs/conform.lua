local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "biome-check", "prettier" },
    css = { "biome-check", "prettier" },
    python = {
      "ruff_fix",
      "ruff_format",
      "ruff_organize_imports",
    },
    javascript = { "biome-check", "biome", "prettier" },
    typescript = { "biome-check", "biome", "prettier" },
    javascriptreact = { "biome-check", "biome", "prettier" },
    typescriptreact = { "biome-check", "biome", "prettier" },
    yaml = { "yq" },
    json = { "jq" },
  },
  format_on_save = false,
  default_format_opts = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

require("conform").setup(options)
