local builtin = require("telescope.builtin")

require('which-key').register ({
    f = {
        name = "Telescope",
        f = { builtin.find_files, "Find File" },
        o = { builtin.oldfiles, "Recent Files" },
        t = { builtin.live_grep, "Live Grep" },
        b = { builtin.buffers, "Search Buffers" },
        c = { builtin.colorscheme, "Colorscheme" },
    },
    o = { name = "Org" }
}, { prefix = "<leader>" })
