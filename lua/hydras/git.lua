local Hydra = require("hydra")

local hint = [[
 Diffview
 _vfh_: view file history     _rfh_: refresh file history
 _vbh_: view branch history

 Octo
 _li_: list issues    _ac_: add comment 

 Gitsigns
 _sh_: stage hunks

 _<Enter>_: Neogit  _q_: exit
]]

Hydra({
  name = "Git",
  hint = hint,
  config = {
    color = "blue",
    invoke_on_body = true,
    hint = {
      border = "rounded",
    },
  },
  body = "<leader>G",
  heads = {
    { "vfh", ":DiffviewFileHistory %<CR>" },
    { "vbh", ":DiffviewFileHistory<CR>" },
    { "rfh", ":DiffviewRefresh<CR>" },

    { "li", ":Octo issue list<CR>" },
    { "ac", ":Octo comment add<CR>" },

    { "sh", ":Gitsigns stage_hunk<CR>" },

    { "<Enter>", ":Neogit<CR>",
      { desc = "Neogit" }
    },
    { "q", nil,
      { exit = true, nowait = true, desc = "exit" }
    },
  }
})
