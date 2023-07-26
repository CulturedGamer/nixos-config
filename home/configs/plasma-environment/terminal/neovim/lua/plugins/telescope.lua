return {
    'nvim-telescope/telescope.nvim',
    -- lazy = false,
    dependencies = {
       'nvim-lua/plenary.nvim'
    },
    keys = {
        { '<leader>ff', '<cmd>Telescope fd<cr>', desc = 'Find files' },
        { '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Recent files' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Search buffers' },
        { '<leader>ft', '<cmd>Telescope live_grep<cr>', desc = 'Search text in current directory' },
        { '<leader>fc', '<cmd>Telescope colorscheme<cr>', desc = 'Set the colorscheme' }
    },
    config = function()
        require('telescope').setup{}
    end,
}
