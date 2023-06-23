Cmd = vim.cmd
Map = vim.keymap.set
Api = vim.api

O = vim.opt -- options
G = vim.g

OS = vim.loop.os_uname().sysname

Api.nvim_set_var("Theme", "nord")
Hl = function(group, val)
  Api.nvim_set_hl(0, group, val)
end
