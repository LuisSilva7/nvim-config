-- Kanagawa Theme Configuration
return {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        -- Setup Kanagawa with custom configurations
        require('kanagawa').setup {
            compile = false, -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false, -- do not set background color
            dimInactive = false, -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = { -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                return {}
            end,
            theme = 'wave', -- Load "wave" theme when 'background' option is not set
            background = { -- map the value of 'background' option to a theme
                dark = 'wave', -- try "dragon" !
                light = 'lotus',
            },
        }

        -- Set options 'laststatus' and 'cmdheight' before loading the theme
        vim.opt.laststatus = 3 -- global statusline
        vim.opt.cmdheight = 1 -- default command-line height

        -- Load Kanagawa colorscheme
        vim.cmd 'colorscheme kanagawa'

        -- Add keymap for toggling background transparency
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
