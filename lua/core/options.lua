-- Left column and similar settings
vim.opt.number = true -- Make line numbers default (default: false)
vim.opt.relativenumber = true -- Set relative numbered lines (default: false)
vim.opt.numberwidth = 3 -- Set number column width to 2 {default 4} (default: 4)
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default (default: 'auto')
vim.opt.wrap = false -- Display lines as one long line (default: true)
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
vim.opt.sidescrolloff = 10 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)
vim.opt.showtabline = 2 -- Always show tabs (default: 1)

-- Tab spacing/behavior
vim.opt.expandtab = true -- Convert tabs to spaces (default: false)
vim.opt.shiftwidth = 4 -- The number of spaces inserted for each indentation (default: 8)
vim.opt.tabstop = 4 -- Insert n spaces for a tab (default: 8)
vim.opt.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
vim.opt.smartindent = true -- Make indenting smarter again (default: false)
vim.opt.breakindent = true -- Enable break indent (default: false)
vim.opt.linebreak = true -- Companion to wrap, don't split words (default: false)

-- Searching behaviours
vim.opt.hlsearch = true -- Set highlight on search (default: true) - with keymap to toggle
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
vim.opt.smartcase = true -- Smart case (default: false)
vim.opt.iskeyword:append '-' -- Hyphenated words recognized by searches (default: does not include '-')

-- Autocompletion behaviours
vim.opt.pumheight = 10 -- Pop up menu height (default: 0)
vim.opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience (default: 'menu,preview')
vim.opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages (default: does not include 'c')

-- General behaviours
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.backup = false -- Creates a backup file (default: false)
vim.opt.clipboard = '' -- Sync clipboard between OS and Neovim. (sync: 'unnamedplus')
vim.opt.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)
vim.opt.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
vim.opt.mouse = 'a' -- Enable mouse mode (default: '')
vim.opt.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)
vim.opt.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
vim.opt.splitright = true -- Force all vertical splits to go to the right of current window (default: false)
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
vim.opt.timeoutlen = 500 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
vim.opt.updatetime = 200 -- Decrease update time (default: 4000)
vim.opt.undofile = true -- Save undo history (default: false)
vim.opt.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
vim.opt.swapfile = false -- Creates a swapfile (default: true)
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
