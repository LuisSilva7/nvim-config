return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    build = ':TSUpdate',
    config = function()
        local ts_config = require("nvim-treesitter.configs")

        ts_config.setup({
            ensure_installed = {
              'lua',
              'python',
              'javascript',
              'typescript',
              'vimdoc',
              'vim',
              'regex',
              'terraform',
              'sql',
              'dockerfile',
              'toml',
              'json',
              'java',
              'groovy',
              'go',
              'gitignore',
              'graphql',
              'yaml',
              'make',
              'cmake',
              'markdown',
              'markdown_inline',
              'bash',
              'tsx',
              'css',
              'html',
            },
            highlight = {enable = true},

            autotag = {
                enable = true
            }
        })
    end
}
