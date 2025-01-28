-- Nord Theme Configuration
local function ColorMyPencils(color)
  color = color or 'nord' -- Default color scheme is Nord if not specified
  require('nord').set()
end

local function ToggleBackground(color)
  color = color or 'nord' -- Default color scheme is Nord if not specified

  if color == 'nord' then
    local bg_transparent = true
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.nord_disable_background = bg_transparent
      vim.cmd [[colorscheme nord]] -- Reapply Nord theme after toggling transparency
    end

    -- Set keymap for toggling background transparency for Nord
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end
end

return {
  'shaunsingh/nord.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false

    -- Apply Nord theme
    ColorMyPencils 'nord'

    -- Activate Background Toggle
    ToggleBackground 'nord'
  end,
}
