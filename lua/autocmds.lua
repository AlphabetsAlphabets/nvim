return {
  {
    name = "Folds",
    {
      'BufWritePost',
      ':mkview | filetype detect | set foldmethod=manual',
    },
    {
      'QuitPre',
      ':mkview | filetype detect | set foldmethod=manual'
    },
    {
      'BufWinEnter',
      ':silent! loadview | filetype detect | set foldmethod=manual'
    }
  }
}
