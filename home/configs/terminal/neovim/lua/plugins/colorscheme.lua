return {
    {
        'RRethy/nvim-base16',
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme 'base16-gruvbox-dark-hard'
        end 
    },

    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme 'nightfox'
        end
    },

    {
        'Tsuzat/NeoSolarized.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme 'NeoSolarized'
        end
    },

    {
        'navarasu/onedark.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup {
                style = 'darker'
            }
            -- vim.cmd.colorscheme 'onedark'
        end
    },
    
    {
        'aktersnurra/no-clown-fiesta.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme 'no-clown-fiesta'
        end
    },

    { 
        'lunarvim/darkplus.nvim',
        lazy = false,
        priority = 1000,
        config = function()
           vim.cmd.colorscheme 'darkplus'
        end
    },
}
