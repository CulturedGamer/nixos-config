local builtin = require("telescope.builtin")

require("which-key").register({
	f = {
		name = "Telescope",
		f = { builtin.find_files, "Find File" },
		o = { builtin.oldfiles, "Recent Files" },
		t = { builtin.live_grep, "Live Grep" },
		b = { builtin.buffers, "Search Buffers" },
		c = { builtin.colorscheme, "Colorscheme" },
	},
	c = {
		name = "Compile",
		n = {
			name = "Compile/Evaluate Nix",
			c = { "<cmd>!nix build<cr>", "Nix Build" },
			b = { "<cmd>!nix run<cr>", "Nix Run" },
		},
	},
	h = {
		j = { require("harpoon"):list():append(), "Add file to Harpoon" },
		h = { require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()), "Toggle Harpoon's quick menu" },
		a = { require("harpoon"):list():select(1), "Navigate to mark 1" },
		s = { require("harpoon"):list():select(2), "Navigate to mark 2" },
		d = { require("harpoon"):list():select(3), "Navigate to mark 3" },
		f = { require("harpoon"):list():select(4), "Navigate to mark 4" },
	},
	n = {
		name = "Neorg",
		n = { "<cmd>Neorg workspace neorg<cr>", "Go to neorg workspace" },
		r = { "<cmd>Neorg return<cr>", "Return" },
		j = {
			name = "Journal",
			t = { "<cmd>Neorg journal today<cr>", "Today" },
			T = { "<cmd>Neorg journal tomorrow<cr>", "Tomorrow" },
			c = { "<cmd>Neorg journal toc<cr>", "Table of Contents" },
			v = { "<cmd>Neorg journal template<cr>", "Template" },
		},
	},
	t = {
		name = "Trouble",
		t = { "<cmd>TroubleToggle<cr>", "Toggle" },
		r = { "<cmd>TroubleRefresh<cr>", "Refresh" },
		d = { "<cmd>TroubleClose<cr>", "Close" },
	},
}, { prefix = "<leader>" })
