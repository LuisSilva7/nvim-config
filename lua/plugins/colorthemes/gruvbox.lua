-- Gruvbox Theme Configuration
local function ColorMyPencils()
  require('gruvbox').setup {
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = '', -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  }
  vim.cmd 'colorscheme gruvbox'
end

local function ToggleBackground()
  local bg_transparent = false
  local toggle_transparency = function()
    bg_transparent = not bg_transparent
    require('gruvbox').setup {
      transparent_mode = bg_transparent,
    }
    vim.cmd 'colorscheme gruvbox' -- Reapply Gruvbox with new settings
  end

  -- Set keymap for toggling background transparency for Gruvbox
  vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
end

return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- Apply Gruvbox theme with the updated configuration
    ColorMyPencils()

    -- Activate Background Toggle
    ToggleBackground()
  end,
}
