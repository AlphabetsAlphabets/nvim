local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>ff", function() fzf.files() end)
vim.keymap.set("n", "<leader>bl", function() fzf.blines() end)
vim.keymap.set("n", "<leader>rg", function() fzf.grep() end)

