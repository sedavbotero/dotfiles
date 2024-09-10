return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local colors = {
            color2   = '#000000',
            color3   = '#d4bfff',
            color4   = '#d9d7ce',
            color5   = '#272d38',
            color13  = '#bbe67e',
            color10  = '#59c2ff',
            color8   = '#f07178',
            color9   = '#607080',
        }

        local theme = {
            visual = {
                a = { fg = colors.color2, bg = colors.color3, gui = 'bold' },
                b = { fg = colors.color4, bg = colors.color5 },
            },
            replace = {
                a = { fg = colors.color2, bg = colors.color8, gui = 'bold' },
                b = { fg = colors.color4, bg = colors.color5 },
            },
            inactive = {
                c = { fg = colors.color4, bg = colors.color2 },
                a = { fg = colors.color4, bg = colors.color5, gui = 'bold' },
                b = { fg = colors.color4, bg = colors.color5 },
            },
            normal = {
                c = { fg = colors.color9, bg = colors.color2 },
                a = { fg = colors.color2, bg = colors.color10, gui = 'bold' },
                b = { fg = colors.color4, bg = colors.color5 },
            },
            insert = {
                a = { fg = colors.color2, bg = colors.color13, gui = 'bold' },
                b = { fg = colors.color4, bg = colors.color5 },
            },
        }

        require('lualine').setup {
            options = { theme  = theme },
        }
    end,
    -- opts = {
        --     options = {
            --         --theme = 'tokyonight',
            --         icons_enabled = true,
            --         theme = 'onedark',
            --         component_separators = { left = '', right = ''},
            --         section_separators = { left = '', right = ''},
            --         disabled_filetypes = {
                --             statusline = {},
                --             winbar = {},
                --         },
                --         ignore_focus = {},
                --         always_divide_middle = true,
                --         globalstatus = false,
                --         refresh = {
                    --             statusline = 1000,
                    --             tabline = 1000,
                    --             winbar = 1000,
                    --         }
                    --     },
                    --     sections = {
                        --         lualine_a = {'mode'},
                        --         lualine_b = {'branch', 'diff', 'diagnostics'},
                        --         lualine_c = {'filename'},
                        --         lualine_x = {'encoding', 'fileformat', 'filetype'},
                        --         lualine_y = {'progress'},
                        --         lualine_z = {'location'}
                        --     },
                        --     inactive_sections = {
                            --         lualine_a = {},
                            --         lualine_b = {},
                            --         lualine_c = {'filename'},
                            --         lualine_x = {'location'},
                            --         lualine_y = {},
                            --         lualine_z = {}
                            --     },
                            --     tabline = {},
                            --     winbar = {},
                            --     inactive_winbar = {},
                            --     extensions = {}
                            -- },
                        }
