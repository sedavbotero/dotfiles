return {
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        dependecies = {
              "micangl/cmp-vimtex",
              opts = {
                  sources = {
                      { name = 'vimtex', },
                  },
              }
        },
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_quickfix_ignore_filters = {"Foreign command"}
        end
    }
}
