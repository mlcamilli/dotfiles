local M = {}


M.setup = function()
  return {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
    event = "VeryLazy",
    config = function()
      local cmp = require('cmp')
      local icons = _G.icons
      local luasnip = require("luasnip")
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
      cmp.setup({
        debug = false,
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        window = {
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        completion = {
          keyword_length = 1,
        },

        mapping = {
          ['<C-j>'] = cmp.mapping.select_next_item(
            { behavior = cmp.SelectBehavior.Select }),
          ['<C-k>'] = cmp.mapping.select_prev_item(
            { behavior = cmp.SelectBehavior.Select }),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<Tab>'] = cmp.mapping({
            i = function(fallback)
              -- If an option was explicitely selected, accept it.
              local entry = cmp.get_selected_entry()

              if entry ~= nil then
                cmp.confirm({ select = false })
                return
              end

              if cmp.visible() then
                cmp.confirm({ select = true })
              else
                fallback()
              end
            end,
          }),
          ['<S-Tab>'] = function(fallback)
            fallback()
          end,
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        },

        sources = {
          { name = 'nvim_lsp_signature_help' },
          { name = 'nvim_lsp' },
          {
            name = 'buffer',
            options = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
          { name = 'luasnip' },
          { name = 'path' },
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, item)
            local kind_name = item.kind
            item.kind = icons[item.kind] or ''
            item.menu = ({
              nvim_lsp = '[L]',
              buffer = '[B]',
              path = '[P]',
              nvim_lsp_signature_help = "[S]",
            })[entry.source.name] .. ' ' .. kind_name
            return item
          end,
        },

        experimental = {
          ghost_text = {
            hl_group = 'Whitespace'
          },
        },
      })
    end

  }
end
