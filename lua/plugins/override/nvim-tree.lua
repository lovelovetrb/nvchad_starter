return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = function()
    local cfg = require "nvchad.configs.nvimtree"
    cfg["git"]["ignore"] = false
    return cfg
  end,
}
