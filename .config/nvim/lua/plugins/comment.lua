-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
--[[
return {
{
'numToStr/Comment.nvim',
opts = {
-- add any options here
pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
},
dependecies = {
'JoosepAlviste/nvim-ts-context-commentstring',
config = function ()
require('ts_context_commentstring').setup {
enable_autocmd = true,
}
-- vim.g.skip_ts_context_commentstring_module = true
end
},
},
}

--]]
return {
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        lazy = false,
        config = function ()
            require('ts_context_commentstring').setup {
                enable_autocmd = false,
            }
            -- vim.g.skip_ts_context_commentstring_module = true
        end
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {
            -- add any options here
            -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
             ---Function to call before (un)comment
             -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
             ---Function to call after (un)comment
             post_hook = nil,
        },
    },
}
