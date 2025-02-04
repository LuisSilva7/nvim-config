-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = 'Vertical scroll down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = 'Vertical scroll up' })

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true, desc = 'Find after' })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true, desc = 'Find before' })

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Down>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = 'Toggle next buffer' })
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', { noremap = true, silent = true, desc = 'Close buffer' })

-- Better window navigation
vim.keymap.set('n', '<C-h>', ':wincmd h<cr>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', ':wincmd l<cr>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', ':wincmd j<cr>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', ':wincmd k<cr>', { desc = 'Move focus to the upper window' })

-- Manage tabs
vim.keymap.set('n', '<leader>tc', ':tabnew<cr>', { desc = '[T]ab [C]reat New' })
vim.keymap.set('n', '<leader>tn', ':tabnext<cr>', { desc = '[T]ab [N]ext' })
vim.keymap.set('n', '<leader>tp', ':tabprevious<cr>', { desc = '[T]ab [P]revious' })

-- Easily split windows
vim.keymap.set('n', '<leader>wv', ':vsplit<cr>', { desc = '[W]indow Split [V]ertical' })
vim.keymap.set('n', '<leader>wh', ':split<cr>', { desc = '[W]indow Split [H]orizontal' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { noremap = true, silent = true, desc = 'Toggle line wrapping' })

-- Remove search highlights after searching
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { noremap = true, silent = true, desc = 'Remove search highlights' })

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true, desc = 'Delete char' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Move text up and down
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Visual Block --
-- Move text up and down
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('x', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('x', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Copy to system clipboard
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<leader>y', '"+yy', { noremap = true, silent = true, desc = 'Copy line to system clipboard' })

-- Paste without losing the register
vim.keymap.set('x', '<leader>rp', '"_dP', { noremap = true, silent = true, desc = 'Paste without losing register' })
vim.keymap.set('v', 'p', '"_dP', { noremap = true, silent = true })

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', 'o<Esc>"+p', { noremap = true, silent = true, desc = 'Paste from system clipboard down' })
vim.keymap.set('n', '<leader>P', 'O<Esc>"+p', { noremap = true, silent = true, desc = 'Paste from system clipboard up' })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from system clipboard in visual mode' })

-- Manage files
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', { noremap = true, silent = true, desc = 'Save file' })
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', { noremap = true, silent = true, desc = 'Quit file' })

-- Create file
vim.keymap.set('n', '<leader>nf', function()
  local filename = vim.fn.input 'New file: '
  if filename and filename ~= '' then
    vim.cmd('e ' .. filename)
  end
end, { desc = 'Create a new file' })

-- Create directory
vim.keymap.set('n', '<leader>nd', function()
  local dirname = vim.fn.input 'New directory: '
  if dirname and dirname ~= '' then
    vim.fn.mkdir(dirname, 'p')
    print('Directory created: ' .. dirname)
  end
end, { desc = 'Create a new directory' })

-- Add JSON tags to a struct in Go
vim.keymap.set('n', '<leader>gjt', ':GoTagAdd json<CR>', { silent = true, noremap = true, desc = 'Add JSON tags to struct' })
