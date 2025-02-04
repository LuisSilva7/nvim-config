return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    -- Automatically closes tags
    'windwp/nvim-ts-autotag',
  },
  build = ':TSUpdate',
  config = function()
    local ts_config = require 'nvim-treesitter.configs'

    ts_config.setup {
      ensure_installed = {
        -- Programming Languages
        'bash',
        'c',
        'c_sharp',
        'cpp',
        'dart',
        'elixir',
        'go',
        'gomod',
        'gosum',
        'groovy',
        'java',
        'javascript',
        'lua',
        'php',
        'python',
        'r',
        'ruby',
        'rust',
        'solidity',
        'typescript',
        'vim',
        'zig',

        -- Frameworks and Web
        'css',
        'graphql',
        'html',
        'tsx',
        'vue',

        -- Configuration and Infrastructure
        'cmake',
        'dockerfile',
        'gitignore',
        'json',
        'make',
        'nginx',
        'sql',
        'terraform',
        'toml',
        'yaml',

        -- Documentation and Text Format
        'csv',
        'markdown',
        'markdown_inline',
        'query',
        'regex',
        'tmux',
        'vimdoc',
      },
      highlight = { enable = true },

      -- Automatically installs parser when opening a file
      -- auto_install = true,

      autotag = {
        enable = true,
      },
    }
  end,
}
