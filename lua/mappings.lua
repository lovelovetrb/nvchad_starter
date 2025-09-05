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
map("n", "H", "^", { desc = "move beginning of line" }) -- Move to the beginning of the line
map("n", "L", "$", { desc = "move ending of line" }) -- Move to the end of the line

map("n", "<leader>q", "<cmd>q!<CR>", { desc = "quit" }) -- Quit without saving

map("n", "<C-f>", function()
  require("conform").format()
end, { desc = "formatting" }) -- Format the current buffer using Conform

map("n", "<leader>t", "<cmd>LazyGit<CR>", { desc = "lazygit" }) -- Open LazyGit

map("n", "<leader>r", vim.diagnostic.open_float, { desc = "open diagnostic of float window" })

map("n", "<leader>pd", function()
  require("overlook.api").peek_definition()
end, { desc = "Overlook: Peek definition" }) -- Peek the definition of the symbol under the cursor

map("n", "<leader>pc", function()
  require("overlook.api").close_all()
end, { desc = "Overlook: Close all popup" })

map("n", "<leader>pu", function()
  require("overlook.api").restore_popup()
end, { desc = "Overlook: Restore popup" })

-- ### Visual Mode
map("v", "v", "$h", { desc = "行末まで選択" })

-- ### Terminal Mode
map("t", "qq", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))
