return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
        require('which-key').register ({
            f = {
                name = "Telescope"
            }
        })
    end,
}
