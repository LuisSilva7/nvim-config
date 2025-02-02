return {
  {
    'L3MON4D3/LuaSnip',
    build = (function()
      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        return
      end
      return 'make install_jsregexp'
    end)(),
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load() -- Lazy-load VSCode-like snippets
        end,
      },
    },
  },

  -- cmp-luasnip: Integration between LuaSnip and nvim-cmp
  'saadparwaiz1/cmp_luasnip',

  -- nvim-cmp: Autocompletion plugin
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter', -- Lazy-load when entering Insert mode
    dependencies = {
      'hrsh7th/cmp-buffer', -- Buffer-based completion
      'hrsh7th/cmp-path', -- Path-based completion
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      -- Icons for completion item kinds
      local kind_icons = {
        Text = '󰉿',
        Method = 'm',
        Function = '󰊕',
        Constructor = '',
        Field = '',
        Variable = '󰆧',
        Class = '󰌗',
        Interface = '',
        Module = '',
        Property = '',
        Unit = '',
        Value = '󰎠',
        Enum = '',
        Keyword = '󰌋',
        Snippet = '',
        Color = '󰏘',
        File = '󰈙',
        Reference = '',
        Folder = '󰉋',
        EnumMember = '',
        Constant = '󰇽',
        Struct = '',
        Event = '',
        Operator = '󰆕',
        TypeParameter = '󰊄',
      }

      -- nvim-cmp setup
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Expand the snippet
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert', -- Configure completion menu behavior
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(), -- Select next item
          ['<C-p>'] = cmp.mapping.select_prev_item(), -- Select previous item
          ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
          ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Scroll docs down
          ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion
          ['<CR>'] = cmp.mapping.confirm { select = true }, -- Confirm selection
          ['<C-e>'] = cmp.mapping.abort(), -- Close completion window
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump() -- Expand or jump in snippet
            end
          end, { 'i', 's' }), -- Expand snippet in insert mode or jump
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1) -- Jump to previous snippet location
            end
          end, { 'i', 's' }), -- Jump back to previous snippet location
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- Select next item
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump() -- Expand or jump to next snippet
            else
              fallback() -- Fallback action if no other action is possible
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- Select previous item
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1) -- Jump back to previous snippet
            else
              fallback() -- Fallback action if no other action is possible
            end
          end, { 'i', 's' }),
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' }, -- LSP-based completion
          { name = 'luasnip' }, -- Snippet-based completion
          { name = 'buffer' }, -- Buffer-based completion
          { name = 'path' }, -- Path-based completion
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind]) -- Add icons to the completion items
            vim_item.menu = ({
              nvim_lsp = '[LSP]',
              luasnip = '[Snippet]',
              buffer = '[Buffer]',
              path = '[Path]',
            })[entry.source.name] -- Set label for each completion source
            return vim_item
          end,
        },
      }
    end,
  },
}
