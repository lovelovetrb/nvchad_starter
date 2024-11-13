require "nvchad.mappings"

local map = vim.keymap.set

-- ### Insert Mode
map("i", "jj", "<ESC>")

map(
  "i",
  "<C-y>",
  'copilot#Accept("<CR>")',
  { noremap = true, silent = true, expr = true, script = true, replace_keycodes = false }
)

-- ### Normal Mode
map("n", "<leader>h", "^", { desc = "move beginning of line" })
map("n", "<leader>l", "$", { desc = "move ending of line" })

map("n", "<leader>q", "<cmd>q!<CR>", { desc = "quit" })

map("n", "<C-f>", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "formatting" })

map("n", "<leader>t", '<cmd>LazyGit<CR>', { desc = "lazygit" })

-- ### Visual Mode
map("v", "v", "$h", { desc = "行末まで選択" })

-- ### Terminal Mode
map("t", "qq", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))
