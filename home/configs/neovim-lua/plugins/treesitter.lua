return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('orgmode').setup_ts_grammar()

        require('nvim-treesitter.configs').setup {
            -- ensure_installed = { 'c', 'lua', 'rust', 'yaml', 'cpp', 'org' },
            ensure_installed = {};
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                disable = { },
                additional_vim_regex_highlighting = { 'org' }
            },
            indent = {
                enable = true,
                disable = { 'yaml' }
            }
        }
    end,
}
