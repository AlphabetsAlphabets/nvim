-- vim.cmd([[
-- augroup SaveFoldsWhenWriting
--     autocmd!
--     autocmd BufWritePost * mkview | filetype detect
-- augroup end

-- augroup SaveFoldsWhenQuitting
--     autocmd!
--     autocmd QuitPre * mkview | filetype detect
-- augroup end

-- augroup LoadFoldOnStartup
--   autocmd!
--   autocmd BufWinEnter * silent! loadview | filetype detect
-- augroup end
-- ]])
