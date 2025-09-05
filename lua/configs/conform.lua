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
    -- javascript = { "biome-organize-imports", "biome", "prettier" },
    javascript = { "biome-check", "biome", "prettier" },
    typescript = { "biome-check", "prettier" },
    javascriptreact = { "biome-check", "prettier" },
    typescriptreact = { "biome-check", "prettier" },
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
