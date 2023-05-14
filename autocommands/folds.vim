augroup SaveFoldsWhenWriting
    autocmd!
    autocmd BufWritePost * mkview
augroup end

augroup SaveFoldsWhenQuitting
    autocmd!
    autocmd QuitPre * mkview
augroup end

augroup LoadFoldOnStartup
  autocmd!
  autocmd BufWinEnter * silent! loadview
augroup end
