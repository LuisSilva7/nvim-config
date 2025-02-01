return {
  'rebelot/kanagawa.nvim',
  name = 'kanagawa',
  lazy = false,
  priority = 1000,
  config = function()
    -- Kanagawa colorscheme settings
    require('kanagawa').setup {
      compile = false, -- Enable compiling the colorscheme
      undercurl = true, -- Enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- Do not set background color
      dimInactive = false, -- Dim inactive window ':h hl-NormalNC'
      terminalColors = true, -- Define vim.g.terminal_color_{0,17}
      colors = { -- Add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      theme = 'wave', -- Load "wave" theme when 'background' option is not set
      background = { -- Map the value of 'background' option to a theme
        dark = 'wave', -- Try "dragon"!
        light = 'lotus',
      },
    }

    -- Set options 'laststatus' and 'cmdheight' before loading the theme
    vim.opt.laststatus = 3 -- Global statusline
    vim.opt.cmdheight = 1 -- Default command-line height

    -- Load Kanagawa colorscheme
    vim.cmd 'colorscheme kanagawa'

    -- Function to toggle background transparency
    local bg_transparent = false
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      require('kanagawa').setup {
        transparent = bg_transparent, -- Update transparency mode
      }
      vim.cmd 'colorscheme kanagawa' -- Reapply Kanagawa theme after toggling
    end

    -- Set keymap for toggling background transparency
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })

    -- If compilation is enabled, ensure recompilation when config changes
    vim.api.nvim_create_user_command('CompileKanagawa', function()
      vim.cmd 'KanagawaCompile'
    end, { desc = 'Compile the Kanagawa colorscheme after changes' })
  end,
}

