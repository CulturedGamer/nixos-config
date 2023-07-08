return {
    'tamton-aquib/staline.nvim',
    config = function()
        require('staline').setup {
            sections = {
                left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
                mid = {},
                right = {'file_name', 'line_column' }
            },
        }
    end,
}
