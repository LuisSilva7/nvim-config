return {
  'ThePrimeagen/harpoon',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    -- Set a vim motion to <Shift>m to mark a file with harpoon
    vim.keymap.set('n', '<s-m>', "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = 'Harpoon Mark File' })
    -- Set a vim motion to the tab key to open the harpoon menu to easily navigate frequented files
    vim.keymap.set('n', '<S-Tab>', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = 'Harpoon Toggle Menu' })

    vim.keymap.set('n', '<leader>1', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = 'Harpoon Navigate to File 1' })
    vim.keymap.set('n', '<leader>2', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = 'Harpoon Navigate to File 2' })
    vim.keymap.set('n', '<leader>3', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = 'Harpoon Navigate to File 3' })
    vim.keymap.set('n', '<leader>4', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = 'Harpoon Navigate to File 4' })
  end,
}
