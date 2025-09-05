return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    local lspconfig = require "lspconfig"
    if lspconfig.biome then
      -- NOTE: localのbiome configを読み込むsetting
      lspconfig.biome.setup {
        root_dir = function(fname)
          local util = require "lspconfig.util"
          return util.root_pattern("biome.json", "biome.jsonc", ".git")(fname)
        end,
      }
    end
  end,
}
