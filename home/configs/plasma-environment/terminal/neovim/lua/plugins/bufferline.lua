return {
    'akinsho/bufferline.nvim',
    lazy = false,
    config = function()
        require('bufferline').setup {
            options = {
                separator_style = "slant",
                offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } }
            }
        }
    end
}
