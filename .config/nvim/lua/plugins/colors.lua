return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "storm",
        transparent = true, -- Enable this to disable setting the background color
    },
    init = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme tokyonight]])
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}

--[[
return {
'connorholyday/vim-snazzy',
lazy = false, 
init = function()
vim.cmd "colorscheme snazzy"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end,
}
--]]
