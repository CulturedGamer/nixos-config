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
            vim.cmd.colorscheme 'NeoSolarized'
        end
    },
}
