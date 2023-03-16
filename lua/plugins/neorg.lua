require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {
      config = {
        folds = false
      }
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = { notes = "~/neorg" },
        default_workspace = "notes",
      },
      index = "index.norg"
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.export"] = {}
  }
}
