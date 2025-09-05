return {
  -- "amitds1997/remote-nvim.nvim",
  "johannes-graner/remote-nvim.nvim",
  branch = "fix/pty-argument", -- Pin to GitHub releases
  dependencies = {
    "nvim-lua/plenary.nvim", -- For standard functions
    "MunifTanjim/nui.nvim", -- To build the plugin UI
    "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
  },
  config = function()
    require("remote-nvim").setup {
      log = {
        level = "debug", -- デバッグレベルのログを有効化
      },
      neovim_install_method = "binary",
      client_callback = function(port, _)
        local cmd = ("kitty --title 'Remote Neovim' nvim --server localhost:%s --remote-ui"):format(port)
        vim.notify("Launching new kitty instance: " .. cmd, vim.log.levels.INFO)

        vim.fn.jobstart(cmd, {
          detach = true,
          on_exit = function(_, exit_code)
            if exit_code ~= 0 then
              vim.notify(("Failed to launch kitty, exit code: %s"):format(exit_code), vim.log.levels.ERROR)
            end
          end,
        })
      end,
    }
  end,
  lazy = false,
}
