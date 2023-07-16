O.conceallevel = 3

local load = {
  ["core.defaults"] = {},  -- Loads default behaviour
  ["core.concealer"] = {}, -- Adds pretty icons to your documents
  ["core.dirman"] = {      -- Manages Neorg workspaces
    config = {
      workspaces = {
        notes = "~/Documents/neorg-notes/",
      },
    },
  },
}

return load
