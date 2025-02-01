return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato', -- Define flavour (latte, frappe, macchiato, mocha)
      background = { -- Background options for light and dark modes
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false, -- Disable background transparency by default
      show_end_of_buffer = false, -- Disable '~' at the end of buffers
      term_colors = false, -- Disable terminal colors
      dim_inactive = { enabled = false }, -- Do not dim inactive windows
      no_italic = false, -- Allow italics
      no_bold = false, -- Allow bold
      no_underline = false, -- Allow underlines
      styles = { -- Customize styles for syntax groups
        comments = { 'italic' },
        conditionals = { 'italic' },
      },
      default_integrations = true, -- Use default plugin integrations
      integrations = {
        cmp = true, -- Enable nvim-cmp integration
        gitsigns = true, -- Enable Git signs integration
        nvimtree = true, -- Enable NvimTree integration
        treesitter = true, -- Enable Treesitter integration
        mini = {
          enabled = true, -- Enable Mini plugin integration
        },
      },
    }

    -- Load Catppuccin colorscheme
    vim.cmd.colorscheme 'catppuccin'

    -- Add keymap for toggling background transparency
    local bg_transparent = false
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      require('catppuccin').setup {
        transparent_background = bg_transparent, -- Toggle transparency
      }
      vim.cmd.colorscheme 'catppuccin' -- Reapply the theme
    end

    -- Set keymap for toggling background transparency
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}

