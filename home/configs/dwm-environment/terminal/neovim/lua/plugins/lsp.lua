return {
    'SmiteshP/nvim-navic',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig'
    },
    config = function()
        local navic = require('nvim-navic')
        local lspconfig = require('lspconfig')

        require('mason').setup{}
        require('mason-lspconfig').setup{
            ensure_installed = { "lua_ls", "clangd", "nil_ls" }
        }

        local on_attach = function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                navic.attach(client, bufnr)
            end
        end

        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            },
            on_attach = on_attach
        }

        lspconfig.clangd.setup {
            on_attach = on_attach
        }

        lspconfig.nil_ls.setup {
            on_attach = on_attach
        }

        navic.setup {
            highlight = true;
        }
    end,
}
