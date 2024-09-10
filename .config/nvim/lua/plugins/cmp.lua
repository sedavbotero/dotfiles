return {
    {
        {
            'L3MON4D3/LuaSnip',
            build = "make install_jsregexp",
            lazy = false,
            init = function ()
                require("luasnip").config.set_config({ -- Setting LuaSnip config

                -- Enable autotriggered snippets
                enable_autosnippets = true,

                -- Use Tab (or some other key if you prefer) to trigger visual selection
                store_selection_keys = "<Tab>",
            })
        end,

        dependencies = {
            -- 'friendly-snippets' contains a variety of premade snippets.
            --    See the README about individual language/framework/plugin snippets:
            --    https://github.com/rafamadriz/friendly-snippets
            {
                'rafamadriz/friendly-snippets',
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                end,
            },
        },
    },
},
{
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependecies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        'L3MON4D3/LuaSnip',
        -- Snippet Engine & its associated nvim-cmp source
    },
    config = function ()
        local cmp = require('cmp')
        cmp.setup {
            sources = {
                { name = "nvim_lsp" },
                { name = "cody" },
                { name = "path" },
                { name = "buffer" },
                { name = 'luasnip' }, -- For luasnip users.
            },
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ['<C-y>'] = cmp.mapping.confirm { select = true },

                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Se
                ['<Tab>'] = cmp.mapping.select_next_item(),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        }
        cmp.setup.filetype("tex", {
            sources = {
                { name = 'vimtex' },
                { name = "nvim_lsp" },
                { name = "cody" },
                { name = "path" },
                { name = "buffer" },
                { name = 'luasnip' }, -- For luasnip users.
            },
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ['<C-y>'] = cmp.mapping.confirm { select = true },

                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Se
                ['<Tab>'] = cmp.mapping.select_next_item(),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })

    end
}
    }
