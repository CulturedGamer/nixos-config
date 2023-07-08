return {
    'nvim-tree/nvim-tree.lua',
    keys = {
        { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle nvim-tree' },
    },
    config = function()
        require('nvim-tree').setup()
    end
}
