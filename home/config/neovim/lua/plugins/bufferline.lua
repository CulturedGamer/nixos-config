return {
    'akinsho/bufferline.nvim',
    config = function()
        require('bufferline').setup {
            options = {
                separator_style = "slant",
                offsets = { { filetype = "NvimTree", text = "File Tree", padding = 1 } },
            }
        }
    end,
}
