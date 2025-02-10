local opt = vim.opt
-- Left column and similar settings
opt.number = true -- Make line numbers default (default: false)
opt.relativenumber = true -- Set relative numbered lines (default: false)
opt.numberwidth = 3 -- Set number column width to 2 {default 4} (default: 4)
opt.signcolumn = 'yes' -- Keep signcolumn on by default (default: 'auto')
opt.wrap = false -- Display lines as one long line (default: true)
opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
opt.sidescrolloff = 10 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)
opt.showtabline = 2 -- Always show tabs (default: 1)

-- Tab spacing/behavior
opt.expandtab = true -- Convert tabs to spaces (default: false)
opt.shiftwidth = 4 -- The number of spaces inserted for each indentation (default: 8)
opt.tabstop = 4 -- Insert n spaces for a tab (default: 8)
opt.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
opt.smartindent = true -- Make indenting smarter again (default: false)
opt.breakindent = true -- Enable break indent (default: false)
opt.linebreak = true -- Companion to wrap, don't split words (default: false)

-- Searching behaviours
opt.hlsearch = true -- Set highlight on search (default: true) - with keymap to toggle
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
opt.smartcase = true -- Smart case (default: false)
opt.iskeyword:append '-' -- Hyphenated words recognized by searches (default: does not include '-')

-- Autocompletion behaviours
opt.pumheight = 10 -- Pop up menu height (default: 0)
opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience (default: 'menu,preview')
opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages (default: does not include 'c')

-- General behaviours
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.backup = false -- Creates a backup file (default: false)
opt.clipboard = '' -- Sync clipboard between OS and Neovim. (sync: 'unnamedplus')
opt.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)
opt.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
opt.mouse = 'a' -- Enable mouse mode (default: '')
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)
opt.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
opt.splitright = true -- Force all vertical splits to go to the right of current window (default: false)
opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
opt.timeoutlen = 500 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
opt.updatetime = 200 -- Decrease update time (default: 4000)
opt.undofile = true -- Save undo history (default: false)
opt.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
opt.swapfile = false -- Creates a swapfile (default: true)
opt.formatoptions:remove { 'c', 'r', 'o' } -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
