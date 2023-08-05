return {
    {
        'RRethy/nvim-base16',
        lazy = false,
        priority = 1000,
    },

    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
    },

    {
        'Tsuzat/NeoSolarized.nvim',
        lazy = false,
        priority = 1000,
    },

    {
        'navarasu/onedark.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup {
                style = 'darker'
            }
        end
    },

    {
        'aktersnurra/no-clown-fiesta.nvim',
        lazy = false,
        priority = 1000,
    },

    {
        'lunarvim/darkplus.nvim',
        lazy = false,
        priority = 1000,
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
    }
}
