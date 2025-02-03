return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'j-hui/fidget.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },

  config = function()
    require('fidget').setup {}
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'gopls',
        'ts_ls',
        'pyright',
        'clangd',
        'jsonls',
        'yamlls',
        'dockerls',
        'terraformls',
      },
    }

    local lspconfig = require 'lspconfig'

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local default_setup = function(server)
      lspconfig[server].setup {
        capabilities = capabilities,
      }
    end

    require('mason-lspconfig').setup_handlers {
      default_setup,
      ['gopls'] = function()
        lspconfig.gopls.setup {
          capabilities = capabilities,
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              gofumpt = true,
              usePlaceholders = true,
              completeUnimported = true,
            },
          },
        }
      end,
      ['lua_ls'] = function()
        lspconfig.lua_ls.setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        }
      end,
    }

    vim.diagnostic.config {
      virtual_text = {
        prefix = '●', -- Adds a bullet point as a prefix for a cleaner look
        format = function(diagnostic)
          local code = diagnostic.code and string.format('[%s]', diagnostic.code) or ''
          return string.format('%s %s', code, diagnostic.message) -- Displays the error code along with the message
        end,
      },
      underline = false, -- Disables underlining for a less intrusive appearance
      update_in_insert = true, -- Updates diagnostics in real-time while in insert mode
      float = {
        focusable = true, -- Prevents the diagnostic floating window from being focused
        style = 'minimal', -- Uses a minimal style for the diagnostic popup
        border = 'rounded', -- Adds rounded borders to the floating window
        source = 'if_many', -- Displays the source only if there are multiple sources
        header = '', -- Removes the header from the diagnostic window
        prefix = '', -- Removes the prefix to keep messages clean
      },
      on_ready = function()
        vim.cmd 'highlight DiagnosticVirtualText guibg=NONE' -- Removes background color from inline error messages
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
