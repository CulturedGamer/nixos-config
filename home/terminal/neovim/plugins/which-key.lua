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
    t = { "<cmd>ToggleTerm<cr>", "Toggle" },
    o = { name = "Org" }
}, { prefix = "<leader>" })
