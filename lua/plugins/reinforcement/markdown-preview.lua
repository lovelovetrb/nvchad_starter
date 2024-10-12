-- return {
--   "iamcco/markdown-preview.nvim",
--   cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
--   lazy = false,
--   build = function()
--     vim.fn["mkdp#util#install"]()
--   end,
--   init = function()
--     vim.g.mkdp_theme = "dark"
--   end,
-- }

return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown',                                                      -- Only needed if you have another plugin named markdown.nvim
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  lazy = false,
  config = function()
    require('render-markdown').setup({
      heading = {
        -- Turn on / off heading icon & background rendering
        enabled = true,
        -- Replaces '#+' of 'atx_h._marker'
        -- The number of '#' in the heading determines the 'level'
        -- The 'level' is used to index into the array using a cycle
        -- The result is left padded with spaces to hide any additional '#'
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        -- Added to the sign column
        -- The 'level' is used to index into the array using a cycle
        signs = { '󰫎 ' },
        -- The 'level' is used to index into the array using a clamp
        -- Highlight for the heading icon and extends through the entire line
        backgrounds = { 'DiffAdd', 'DiffChange', 'DiffDelete' },
        -- The 'level' is used to index into the array using a clamp
        -- Highlight for the heading and sign icons
        foregrounds = {
          '@markup.heading.1.markdown',
          '@markup.heading.2.markdown',
          '@markup.heading.3.markdown',
          '@markup.heading.4.markdown',
          '@markup.heading.5.markdown',
          '@markup.heading.6.markdown',
        },
      },
    })
  end,
}
