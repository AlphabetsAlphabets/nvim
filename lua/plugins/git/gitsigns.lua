local map = vim.api.nvim_set_keymap

require('gitsigns').setup()

map("n", "[c", "<cmd>lua require'gitsigns'.next_hunk()<CR>", {})
map("n", "]c", "<cmd>lua require'gitsigns'.prev_hunk()<CR>", {})
map("n", "{c", "<cmd>lua require'gitsigns'.next_hunk({preview = true})<CR>", {})
map("n", "}c", "<cmd>lua require'gitsigns'.prev_hunk({preview = true})<CR>", {})
map("n", "[s", "<cmd>lua require'gitsigns'.preview_hunk_inline()<CR>", {})
map("n", "[S", "<cmd>lua require'gitsigns'.setqflist()<CR>", {})


