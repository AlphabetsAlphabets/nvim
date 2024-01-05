return {
  {
    name = "Folds",
    {
      'BufWritePost',
      ':mkview | filetype detect',
    },
    {
      'QuitPre',
      ':mkview | filetype detect'
    },
    {
      'BufWinEnter',
      ':silent! loadview | filetype detect'
    }
  }
}
