return {
    {
        'ellisonleao/gruvbox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('gruvbox').setup {
                contrast = 'hard'
            }
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
        end
    }
}
