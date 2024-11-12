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
                    'clangd',
                    'bashls',
                    'marksman',
                    'texlab',
                },
                handlers = {
                    function(server_name)
                        lsp_config[server_name].setup({ })
                    end,
                },
            })
            lsp_config.texlab.setup {}
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
    }
