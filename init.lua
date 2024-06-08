vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

local function auto_activate_venv()
  local venv_path = vim.fn.getcwd() .. '/.venv'
  if vim.fn.isdirectory(venv_path) == 1 then
    vim.env.VIRTUAL_ENV = venv_path
    vim.env.PATH = venv_path .. '/bin:' .. vim.env.PATH
    require("noice").redirect(function()
      local notify = require('notify')
      notify("activate -> " .. venv_path, "info", { title = "Activate venv" })
    end)
  end
end

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    auto_activate_venv()
  end
})

require "configs.mason"
