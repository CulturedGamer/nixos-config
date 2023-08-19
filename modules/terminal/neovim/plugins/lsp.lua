local navic = require('nvim-navic')
local lspconfig = require('lspconfig')

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
