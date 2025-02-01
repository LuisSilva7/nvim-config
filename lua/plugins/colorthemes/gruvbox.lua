return {
  'ellisonleao/gruvbox.nvim',
  name = 'gruvbox',
  lazy = false,
  priority = 1000,
  config = function()
    -- Gruvbox colorscheme settings
    require('gruvbox').setup {
      terminal_colors = true, -- Add neovim terminal colors
      undercurl = true,       -- Enable undercurls
      underline = true,       -- Enable underlines
      bold = true,            -- Enable bold text
      italic = {
        strings = true,       -- Italicize strings
        emphasis = true,      -- Italicize emphasis
        comments = true,      -- Italicize comments
        operators = false,    -- Do not italicize operators
        folds = true,         -- Italicize fold markers
      },
      strikethrough = true,   -- Enable strikethrough
      invert_selection = false, -- Do not invert selection colors
      invert_signs = false,    -- Do not invert sign column colors
      invert_tabline = false,  -- Do not invert tabline colors
      invert_intend_guides = false, -- Do not invert indent guides
      inverse = true,          -- Invert background for search, diffs, statuslines, and errors
      contrast = '',           -- Can be "hard", "soft", or empty string
      palette_overrides = {},  -- Override palette colors
      overrides = {},          -- Custom highlight overrides
      dim_inactive = false,    -- Do not dim inactive windows
      transparent_mode = false, -- Disable transparent background
    }

    vim.cmd 'colorscheme gruvbox' -- Apply the Gruvbox theme

    -- Keymap to toggle background transparency
    local bg_transparent = false
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      require('gruvbox').setup {
        transparent_mode = bg_transparent, -- Update transparency mode
      }
      vim.cmd 'colorscheme gruvbox' -- Reapply Gruvbox with updated settings
    end

    -- Set keymap for toggling background transparency for Gruvbox
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}

