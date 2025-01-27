-- Function to apply color scheme
function ColorMyPencils(color)
  color = color or 'nord' -- Default color scheme is Nord if not specified

  -- Apply the chosen color scheme
  if color == 'nord' then
    require('nord').set()
  elseif color == 'gruvbox-material' then
    vim.cmd 'colorscheme gruvbox-material'
  end
end

function ToggleBackground(color)
  color = color or 'nord' -- Default color scheme is Nord if not specified

  -- Apply the chosen color scheme
  if color == 'nord' then
    -- Set transparent background for Nord theme
    local bg_transparent = true
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.nord_disable_background = bg_transparent
      vim.cmd [[colorscheme nord]] -- Reapply Nord theme after toggling transparency
    end

    -- Set keymap for toggling background transparency for Nord
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  elseif color == 'gruvbox-material' then
    -- Set transparent background for Gruvbox Material theme
    local bg_transparent = true
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.gruvbox_material_transparent_background = bg_transparent
      vim.cmd 'colorscheme gruvbox-material' -- Reapply Gruvbox Material theme after toggling transparency
    end

    -- Set keymap for toggling background transparency for Gruvbox Material
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end
end

return {
  -- Theme 1: Nord
  {
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
  },

  -- Theme 2: Gruvbox Material
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_bold = 0
      vim.g.gruvbox_material_italic = 0
      vim.g.gruvbox_material_transparent_background = 1

      -- Apply Gruvbox Material theme
      -- ColorMyPencils 'gruvbox-material'

      -- Activate Background Toggle
      -- ToggleBackground 'gruvbox-material'
    end,
  },
}
