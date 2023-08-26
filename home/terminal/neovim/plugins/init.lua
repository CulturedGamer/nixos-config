require ("plugins.bufferline")
require ("plugins.flash")
require ("plugins.lualine")
require ("plugins.treesitter")
require ("plugins.vimtex")
require ("plugins.which-key")

require ("plugins.cmp")
require ("plugins.lsp")

require ("Comment").setup()
require ("gitsigns").setup()
require ("nvim-autopairs").setup()
require ("nvim-tree").setup()
require ("orgmode").setup()
require ("todo-comments").setup()

require ("onedark").setup { style = "darker" }
require ("onedark").load()
