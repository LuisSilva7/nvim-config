return {
  -- Configuration for gitsigns.nvim with customized signs
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      signs_staged = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    config = function()
      -- Configure gitsigns
      require('gitsigns').setup {}

      -- Keymap to preview changes (hunks) in normal mode
      vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', { desc = '[G]it Preview [H]unk' })
    end,
  },

  -- Configuration for vim-fugitive
  {
    'tpope/vim-fugitive',
    config = function()
      -- Keymap to show Git blame
      vim.keymap.set('n', '<leader>gb', ':Git blame<cr>', { desc = '[G]it [B]lame' })
      -- Keymap to add all files to the staging area
      vim.keymap.set('n', '<leader>gA', ':Git add .<cr>', { desc = '[G]it Add [A]ll' })
      -- Keymap to add the current file to the staging area
      vim.keymap.set('n', '<leader>ga', ':Git add<cr>', { desc = '[G]it [A]dd' })
      -- Keymap to commit the current changes
      vim.keymap.set('n', '<leader>gc', ':Git commit<cr>', { desc = '[G]it [C]ommit' })
      -- Keymap to push the committed changes to the remote repository
      vim.keymap.set('n', '<leader>gp', ':Git push<cr>', { desc = '[G]it [P]ush' })
    end,
  },
}
