--- filetype detect in the autocmds screws up the whole thing with
--- omnifunc in the LSP. It should be removed. For now this file is
--- no longer sourced. Once I'm sure this is the problem, I'll source
--- it again.

local folds_augroup = vim.api.nvim_create_augroup("Folds", { clear=true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = folds_augroup,
    command = "mkview | set foldmethod=manual"
})

vim.api.nvim_create_autocmd("QuitPre", {
    group = folds_augroup,
    command = "mkview | set foldmethod=manual"
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = folds_augroup,
    command = "silent! loadview | set foldmethod=manual | normal! zM"
})

