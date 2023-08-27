vim.o.shell = "fish"

require("toggleterm").setup {
    size = 14,
    shell = vim.o.shell
}
