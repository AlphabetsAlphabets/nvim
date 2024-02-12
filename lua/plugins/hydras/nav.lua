local fzf = require("fzf-lua")
local hint = [[
_m_: View marks
_j_: View jumplist

_q_: exit
]]

Hydra({
    name = "Navigation",
    hint = hint,
    config = {
        color = "blue",
        invoke_on_body = true,
        hint = {
            border = "rounded",
        },
    },
    body = "<leader>N",
    heads = {
        {"m", function() fzf.marks() end},
        {"j", function() fzf.jumps() end},

        { "q", nil,
            { exit = true, nowait = true, desc = "exit" }
        },
    }
  }
)

