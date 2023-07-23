vim.cmd([[ nnoremap <expr> k (v:count >= 5 ? "m'" . v:count : "") . 'k' ]])
vim.cmd([[ nnoremap <expr> j (v:count >= 5 ? "m'" . v:count : "") . 'j' ]])

-- Misc
vim.keymap.set("n", "<Space>", "<Nop>")
vim.keymap.set("n", "<C-c>", "<cmd>nohl<CR>")
vim.keymap.set("n", "<leader><leader>x", ":wa | so %<CR>")

-- Windows
--- Window navigation
vim.keymap.set("n", "<A-c>", ":close<CR>") -- Close floating windows
vim.keymap.set("n", "<A-q>", ":q<CR>")
vim.keymap.set("n", "<C-f>", ":on<CR>")
vim.keymap.set("n", "<A-a>", "<C-w>h")
vim.keymap.set("n", "<A-s>", "<C-w>j")
vim.keymap.set("n", "<A-w>", "<C-w>k")
vim.keymap.set("n", "<A-d>", "<C-w>l")

--- Resizing window
vim.keymap.set("n", "<A-n>", "<C-w>=")
vim.keymap.set("n", "<A-A>", "<C-w>h<C-w>|")
vim.keymap.set("n", "<A-S>", "<C-w>j<C-w>_")
vim.keymap.set("n", "<A-W>", "<C-w>k<C-w>_")
vim.keymap.set("n", "<A-D>", "<C-w>l<C-w>|")

-- Quick fix
vim.keymap.set("n", "[qc", ":ccl<CR>")
vim.keymap.set("n", "[qo", ":copen<CR>")

vim.keymap.set("n", "<leader>.", "5<C-w>>")
vim.keymap.set("n", "<leader>,", "5<C-w><")

--- Movement
vim.keymap.set("n", "s", "$")
vim.keymap.set("n", "S", "^")

vim.keymap.set("v", "s", "$")
vim.keymap.set("v", "S", "^")

vim.keymap.set("n", "{", "}")
vim.keymap.set("n", "{", "}")

vim.keymap.set("v", "}", "{")
vim.keymap.set("v", "}", "{")

vim.keymap.set("v", "<A-j>", "<C-d>")
vim.keymap.set("v", "<A-k>", "<C-u>")

vim.keymap.set("n", "<A-j>", "<C-d>")
vim.keymap.set("n", "<A-k>", "<C-u>")

vim.keymap.set("v", "<A-j>", "<C-d>")
vim.keymap.set("v", "<A-k>", "<C-u>")

-- Project navigation
vim.keymap.set("n", "<leader>tt", "<C-w>T")
vim.keymap.set("n", "<C-w>n", ":tabnew<cr>")

vim.keymap.set("n", "<C-k>", ":tabprevious<cr>")
vim.keymap.set("n", "<C-j>", ":tabnext<cr>")
vim.keymap.set("n", "<C-q>", ":tabclose<cr>")

vim.keymap.set("n", "<leader><leader>h", ":echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>")

-- [[ DAP, debugging ]]

-- vim.keymap.set("n", "<leader>z", "<cmd>NoNeckPain<CR>")
