return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'stevearc/conform.nvim', -- Plugin for code formatting
    'williamboman/mason.nvim', -- Mason for automatic installation of LSPs
    'williamboman/mason-lspconfig.nvim', -- Integration of Mason with lspconfig
    'j-hui/fidget.nvim', -- Displays progress for LSP operations
    "jay-babu/mason-nvim-dap.nvim", -- Automatic installation for debuggers

    -- utility plugin for configuring the java language server for us
    {
      "mfussenegger/nvim-jdtls",
      dependencies = {
        "mfussenegger/nvim-dap", -- Dependency for debugging Java
      }
    },
  },

  config = function()
    -- Initialize fidget.nvim for showing LSP progress
    require('fidget').setup {}

    -- Initialize Mason to install missing LSP servers
    require('mason').setup()

    -- Integrating Mason with lspconfig to ensure specific LSP servers are installed
    require('mason-lspconfig').setup {
      ensure_installed = {
        -- Specify which LSP servers to ensure are installed
        'lua_ls', -- Lua LSP
        'rust_analyzer', -- Rust LSP
        'gopls', -- Go LSP
        'tsserver', -- TypeScript LSP
        'cssls', -- CSS LSP
        'html', -- HTML LSP
        'pyright', -- Python LSP
        'clangd', -- C/C++ LSP
        'ruff', -- Python linting (similar to flake8)
        'pylsp', -- Python LSP
        'jsonls', -- JSON LSP
        'yamlls', -- YAML LSP
        'tailwindcss', -- Tailwind CSS LSP
        'dockerls', -- Docker LSP
        'sqlls', -- SQL LSP
        'terraformls', -- Terraform LSP
      },
      handlers = {
        -- Default handler to set up any LSP server
        function(server_name)
          require('lspconfig')[server_name].setup {}
        end,

        -- Lua language server (lua_ls) specific configuration
        ['lua_ls'] = function()
          local lspconfig = require 'lspconfig'
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                runtime = { version = 'Lua 5.1' }, -- Specify Lua version
                diagnostics = {
                  globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' }, -- Global variables for Lua
                },
              },
            },
          }
        end,
      },
    }

    -- Ensure the required debug adapters are installed
    require('mason-nvim-dap').setup {
      ensure_installed = {
        'java-debug-adapter', -- Java Debug Adapter
        'java-test', -- Java Test Adapter
        'debugpy', -- Python Debugger (debugpy)
        'node-debug2-adapter', -- Node.js Debug Adapter for JS/TS
        'vscode-js-debug', -- Another adapter for JS/TS
        'cpptools', -- C/C++ Debug Adapter
        'delve', -- Go Debugger (Delve)
        'codelldb', -- Rust Debugger (codelldb)
        'ruby-debug-ide', -- Ruby Debug Adapter
        'php-debug-adapter', -- PHP Debug Adapter
        'netcoredbg', -- .NET Debugger
      },
    }

    vim.diagnostic.config {
      virtual_text = {
        prefix = '●',  -- Adds a bullet point as a prefix for a cleaner look
        format = function(diagnostic)
          local code = diagnostic.code and string.format('[%s]', diagnostic.code) or ''
          return string.format('%s %s', code, diagnostic.message)  -- Displays the error code along with the message
        end,
      },
      underline = false,  -- Disables underlining for a less intrusive appearance
      update_in_insert = true,  -- Updates diagnostics in real-time while in insert mode
      float = {
        focusable = true,  -- Prevents the diagnostic floating window from being focused
        style = "minimal",  -- Uses a minimal style for the diagnostic popup
        border = "rounded",  -- Adds rounded borders to the floating window
        source = "if_many",  -- Displays the source only if there are multiple sources
        header = "",  -- Removes the header from the diagnostic window
        prefix = "",  -- Removes the prefix to keep messages clean
      },
      on_ready = function()
        vim.cmd 'highlight DiagnosticVirtualText guibg=NONE'  -- Removes background color from inline error messages
      end,
    }

    -- Set up keybindings for LSP actions (e.g., go to definition, rename, etc.)
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- Helper function to map keys
        local map = function(keys, func, desc, mode)
          mode = mode or 'n' -- Default to normal mode
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Keybindings for various LSP operations
        map('<leader>ch', vim.lsp.buf.hover, '[C]ode [H]over Documentation', { 'n' })
        map('<leader>gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('<leader>gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame symbol')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      end,
    })
  end,
}
