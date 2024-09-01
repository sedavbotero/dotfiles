return {
    {
        'christoomey/vim-tmux-navigator',
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        'easymotion/vim-easymotion',
        config = function ()
            vim.cmd([[
            map <leader>f <Plug>(easymotion-s)
            " map <leader>e <Plug>(easymotion-f)
            map <leader>w <Plug>(easymotion-w)
            ]])
        end
    },
}
