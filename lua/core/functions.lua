Api.nvim_create_user_command("RunCommandInSplit", function(opts)
  local cmd = opts.args
  Cmd("split")
  local cur_win = vim.api.nvim_get_current_win()
  Api.nvim_win_set_height(cur_win, 10)
  Api.nvim_win_set_option(cur_win, "winfixheight", true)

  Cmd({
    cmd = cmd,
    args = {
      vim.fn.bufname("%")
    }
  })
end, { nargs = 1 })

Api.nvim_create_user_command("RunCommand", function(opts)
  local cmd = opts.args
  local file = vim.fn.bufnam("%")
  Cmd("tabnew " .. file)
  Cmd({
    cmd = cmd,
    args = {
      file,
    }
  })
end, { nargs = 1 })
