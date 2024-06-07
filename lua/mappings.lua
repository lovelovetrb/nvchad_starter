require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jj", "<ESC>")

map(
  "i",
  "<C-y>",
  'copilot#Accept("<CR>")',
  { noremap = true, silent = true, expr = true, script = true, replace_keycodes = false }
)

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>h", "^", { desc = "move beginning of line" })
map("n", "<leader>l", "$", { desc = "move beginning of line" })

map("n", "<leader>q", "<cmd>q!<CR>", { desc = "quit" })

map("n", "<C-f>", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "formatting" })

-- map("n", "gcc", function ()
--     require('Comment.api').toggle.linewise.current()
-- end)

map("v", "v", "$h", { desc = "行末まで選択" })
