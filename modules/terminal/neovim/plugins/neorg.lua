require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.summary"] = {},

    -- Broken modules
    -- ["core.tempus"] = {},
    -- ["core.ui.calendar"] = {},

    ["core.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    };

    ["core.dirman"] = {
      config = {
        workspaces = {
            neorg = "~/Documents/neorg/"
        }
      }
    }
  }
}
