return {
  'shaunsingh/nord.nvim',
  name = 'nord',
  lazy = false,
  priority = 1000,
  config = function()
    -- Nord theme settings
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false

    -- Apply Nord theme
    require('nord').set()

    -- Function to toggle background transparency
    local bg_transparent = true
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.nord_disable_background = bg_transparent
      vim.cmd [[colorscheme nord]] -- Reapply Nord theme after toggling transparency
    end

    -- Map key to toggle background transparency
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}

