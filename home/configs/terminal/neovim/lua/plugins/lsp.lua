return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    },
    config = function()
        -- Mason
        require('mason').setup{}
        require('mason-lspconfig').setup{}

        require('mason-lspconfig').setup_handlers {
            function(lua_ls)
                require('lspconfig')[lua_ls].setup {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' }
                            }
                        }
                    }
                }
            end,
        }
    end,
}
