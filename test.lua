-- Currently testing this
-- The returned table is used by legendary.nvim config in qol.lua
-- I'm not sure how to convert these into lua

vim.cmd([[ nnoremap <expr> k (v:count >= 5 ? "m'" . v:count : "") . 'k' ]])
vim.cmd([[ nnoremap <expr> j (v:count >= 5 ? "m'" . v:count : "") . 'j' ]])

vim.cmd([[
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <leader><leader>h :call SynStack()<CR>
]])

local misc_maps = {
  { mode = { "n" }, "<Space>",           "<Nop>",          description = "Unmaps space",                   hide = true },
  { mode = { "n" }, "<C-c>",             "<cmd>nohl<CR>",  description = "Clears highlights", },
  { mode = { "n" }, "<leader><leader>x", ":wa | so %<CR>", description = "Saves and sources current file", },
}

local window_maps = {
  { mode = { "n" }, "<A-a>",     "<C-w>h",       description = "Move to left window", },
  { mode = { "n" }, "<A-s>",     "<C-w>j",       description = "Move to bottom window", },
  { mode = { "n" }, "<A-w>",     "<C-w>k",       description = "Move to top window", },
  { mode = { "n" }, "<A-d>",     "<C-w>l",       description = "Move to right window", },
  { mode = { "n" }, "<A-n>",     "<C-w>=",       description = "Resize windows to be equal", },
  { mode = { "n" }, "<A-A>",     "<C-w>h<C-w>|", description = "Maximizes left window", },
  { mode = { "n" }, "<A-S>",     "<C-w>j<C-w>_", description = "Maximises bottom window", },
  { mode = { "n" }, "<A-W>",     "<C-w>k<C-w>_", description = "Maximizes top window", },
  { mode = { "n" }, "<A-D>",     "<C-w>l<C-w>|", description = "Maximizes right window", },
  { mode = { "n" }, "<leader>.", "5<C-w>>",      description = "", },
  { mode = { "n" }, "<leader>,", "5<C-w><",      description = "", },
}


local quickfix_maps = {
  { mode = { "n" }, "[qc",        ":ccl<CR>",   description = "Closes the quickfix window", },
  { mode = { "n" }, "[qo",        ":copen<CR>", description = "Opens the quickfix window", },
  { mode = { "n" }, "<leader>cn", ":cn<CR>",    description = "To next entry in quickfix window", },
  { mode = { "n" }, "<leader>cp", ":cp<CR>",    description = "To previous entry in quickfix window", },
}

local movement_maps = {
  { mode = { "n" }, "s",     "$",     description = "Moves to first non-blank character of the line", },
  { mode = { "n" }, "S",     "^",     description = "Moves to end of line", },
  { mode = { "v" }, "s",     "$",     description = "Moves to first non-blank character of the line", },
  { mode = { "v" }, "S",     "^",     description = "Moves to end of line", },
  { mode = { "v" }, "<A-j>", "<C-d>", description = "Page down.", },
  { mode = { "v" }, "<A-k>", "<C-u>", description = "Page up.", },
  { mode = { "n" }, "<A-j>", "<C-d>", description = "Page down.", },
  { mode = { "n" }, "<A-k>", "<C-u>", description = "Page up.", },
}

local tab_maps = {
  { mode = { "n" }, "<leader>tt", "<C-w>T",           description = "Send current buffer to new tab.", },
  { mode = { "n" }, "<C-w>n",     ":tabnew<cr>",      description = "Create a new tab", },
  { mode = { "n" }, "<C-k>",      ":tabprevious<cr>", description = "To previous tab.", },
  { mode = { "n" }, "<C-j>",      ":tabnext<cr>",     description = "To next tab.", },
}

local changelist_maps = {
  { mode = { "n" }, "[[", "g;", description = "To previous entry in the changelist. ", },
  { mode = { "n" }, "]]", "g,", description = "To current entry in the changelist. ", },
}

local b = {
  misc_maps,
  window_maps,
  quickfix_maps,
  movement_maps,
  tab_maps,
  changelist_maps
}

local maps = {}

for _, map_category in pairs(b) do
  for _, individual_map in pairs(map_category) do
    table.insert(maps, individual_map)
  end
end


return maps
