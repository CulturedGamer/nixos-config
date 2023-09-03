vim.o.shell = "fish"

require("toggleterm").setup {
    direction = "float";
    open_mapping = [[<c-\>]],
    shell = vim.o.shell,
    size = 14,
}
