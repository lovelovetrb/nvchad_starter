require "nvchad.mappings"

local map = vim.keymap.set

map("i", "jj", "<ESC>")

map(
  "i",
  "<C-y>",
  'copilot#Accept("<CR>")',
  { noremap = true, silent = true, expr = true, script = true, replace_keycodes = false }
)

map("n", "<leader>h", "^", { desc = "move beginning of line" })
map("n", "<leader>l", "$", { desc = "move ending of line" })

map("n", "<leader>q", "<cmd>q!<CR>", { desc = "quit" })

map("n", "<C-f>", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "formatting" })

map("v", "v", "$h", { desc = "行末まで選択" })

map("t", "qq", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))
