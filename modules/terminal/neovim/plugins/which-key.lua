local builtin = require("telescope.builtin")

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

require('which-key').register ({
    f = {
        name = "Telescope",
        f = { builtin.find_files, "Find File" },
        o = { builtin.oldfiles, "Recent Files" },
        t = { builtin.live_grep, "Live Grep" },
        b = { builtin.buffers, "Search Buffers" },
        c = { builtin.colorscheme, "Colorscheme" },
    },
    a = { harpoon_mark.add_file, "Mark file with Harpoon" },
    m = { harpoon_ui.toggle_quick_menu, "Toggle a menu to view marks" },
    o = { name = "Org" }
}, { prefix = "<leader>" })
