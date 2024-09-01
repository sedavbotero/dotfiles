return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            "j-hui/fidget.nvim",

            "hrsh7th/nvim-cmp",
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function ()
            require('mason').setup()
            local lsp_config = require("lspconfig")
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'rust_analyzer',
                    'lua_ls',
                    'pylsp',
                    -- 'pyright',
                    'ltex',
                    'clangd',
                    -- 'bashls',
                    'marksman',
                },
                handlers = {
                    function(server_name)
                        lsp_config[server_name].setup({ })
                    end,
                },
            })
            lsp_config.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim" },
                        },
                    },
                }
            })
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
        end
    },

    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        dependecies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "saadparwaiz1/cmp_luasnip",
            -- Snippet Engine & its associated nvim-cmp source
            {
                'L3MON4D3/LuaSnip',
                build = "make install_jsregexp",
                dependencies = {
                    -- `friendly-snippets` contains a variety of premade snippets.
                    --    See the README about individual language/framework/plugin snippets:
                    --    https://github.com/rafamadriz/friendly-snippets
                    -- {
                        --   'rafamadriz/friendly-snippets',
                        --   config = function()
                            --     require('luasnip.loaders.from_vscode').lazy_load()
                            --   end,
                            -- },
                        },
                    },
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
                end
            }
        }
