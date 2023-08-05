return {
    'nvim-orgmode/orgmode',
    lazy = false,
    config = function()
        require('orgmode').setup {}
    end,
}
