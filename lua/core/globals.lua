Cmd = vim.cmd
Map = vim.keymap.set
Api = vim.api

O = vim.opt -- options
G = vim.g

Theme = "solarized"

Hl = function(group, val)
  Api.nvim_set_hl(0, group, val)
end
