-- Configure Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.alpha',
  require 'plugins.colorthemes.nord',
  require 'plugins.comments',
  require 'plugins.indent-blankline',
  require 'plugins.gitsigns',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.neotree',
  require 'plugins.telescope',
  require 'plugins.harpoon',
  require 'plugins.lsp',
  require 'plugins.treesitter',
  require 'plugins.autocompletion',
  require 'plugins.autoformatting',
  require 'plugins.misc',
  require 'plugins.dap',
  require 'plugins.springboot-nvim',
}
