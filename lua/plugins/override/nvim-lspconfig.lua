return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    vim.keymap.set('n', '<space>r', vim.diagnostic.open_float, { noremap = true, silent = true })
  end,
}
