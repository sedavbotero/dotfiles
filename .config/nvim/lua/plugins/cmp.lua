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

                    -- Use Tab (or some other key _if you prefer) to trigger visual selection
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
        config = function()
            local ls = require("luasnip")
            ls.filetype_extend("javascript", { "jsdoc" })

            --- TODO: What is expand?
            vim.keymap.set({"i"}, "<C-s>e", function() ls.expand() end, {silent = true})

            vim.keymap.set({"i", "s"}, "<C-s>;", function() ls.jump(1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-s>,", function() ls.jump(-1) end, {silent = true})

            vim.keymap.set({"i", "s"}, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, {silent = true})

            ---@diagnostic disable-next-line: duplicate-set-field
            ls.active = function(filter)
                filter = filter or {}
                filter.direction = filter.direction or 1

                if filter.direction == 1 then
                    return ls.expand_or_jumpable()
                else
                    return ls.jumpable(filter.direction)
                end
            end

            ls.jump = function(direction)
                if direction == 1 then
                    if ls.expandable() then
                        return ls.expand_or_jump()
                    else
                        return ls.jumpable(1) and ls.jump(1)
                    end
                else
                    return ls.jumpable(-1) and ls.jump(-1)
                end
            end
        end,
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
                { name = 'luasnip' }, -- For luasnip users.
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
            },

            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ['<C-y>'] = cmp.mapping(
                cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                { "i", "c" }
                ),

                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping.select_next_item(),
            },

            snippet = {
                expand = function(args)
                require('luasnip').lsp_expand(args.body)
                end,
            },

            experimental = {
                ghost_text = true,
                native_menu = false,
            }


        }

    end
},
{
    'saadparwaiz1/cmp_luasnip',
}
    }
