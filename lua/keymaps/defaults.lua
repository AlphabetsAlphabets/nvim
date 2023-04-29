Cmd([[ nnoremap <expr> k (v:count >= 5 ? "m'" . v:count : "") . 'k' ]])
Cmd([[ nnoremap <expr> j (v:count >= 5 ? "m'" . v:count : "") . 'j' ]])

-- Misc
Map("n", "<Space>", "<Nop>", {})
Map("n", "<C-c>", "<cmd>nohl<CR>", {})
Map("n", "<leader>z", "<cmd>NoNeckPain<CR>", {})
Map("n", "<leader><leader>x", ":wa | so %", {})

-- Windows
--- Window navigation
Map("n", "<A-q>", ":q<CR>", {})
Map("n", "<C-f>", ":on<CR>", {})
Map("n", "<A-a>", "<C-w>h", {})
Map("n", "<A-s>", "<C-w>j", {})
Map("n", "<A-w>", "<C-w>k", {})
Map("n", "<A-d>", "<C-w>l", {})

--- Resizing window
Map("n", "<A-n>", "<C-w>=", {})
Map("n", "<A-A>", "<C-w>h<C-w>|", {})
Map("n", "<A-S>", "<C-w>j<C-w>_", {})
Map("n", "<A-W>", "<C-w>k<C-w>_", {})
Map("n", "<A-D>", "<C-w>l<C-w>|", {})

-- Quick fix
Map("n", "[qc", ":ccl<CR>", {})
Map("n", "[qo", ":copen<CR>", {})

Map("n", "<leader>.", "5<C-w>>", {})
Map("n", "<leader>,", "5<C-w><", {})

--- Movement
Map("n", "s", "$", {})
Map("n", "S", "^", {})

Map("v", "s", "$", {})
Map("v", "S", "^", {})

Map("n", "{", "}", { noremap = true })
Map("n", "{", "}", { noremap = true })

Map("v", "}", "{", { noremap = true })
Map("v", "}", "{", { noremap = true })

Map("v", "<A-j>", "<C-d>", {})
Map("v", "<A-k>", "<C-u>", {})

Map("n", "<A-j>", "<C-d>", {})
Map("n", "<A-k>", "<C-u>", {})

Map("v", "<A-j>", "<C-d>", {})
Map("v", "<A-k>", "<C-u>", {})

-- Project navigation
Map("n", "<leader>gor", ":silent !gh repo view --web<CR>", {}) -- send pane to new tab
Map("n", "<leader>tt", "<C-w>T", {})                           -- send pane to new tab
Map("n", "<C-w>n", ":tabnew<cr>", {})

Map("n", "<C-k>", ":tabprevious<cr>", {})
Map("n", "<C-j>", ":tabnext<cr>", {})
Map("n", "<C-q>", ":tabclose<cr>", {})

Map("n", "<leader><leader>h", ":echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>", {})
