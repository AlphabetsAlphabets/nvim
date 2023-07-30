local bg = vim.inspect(vim.cmd.colorscheme())

return {
  "tpope/vim-commentary",
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    event = "ColorScheme",
    opts = {
      width = 80,
      background = bg,
      autocmds = {
        enableOnVimEnter = false,
      }
    },
    config = function()
      vim.cmd("NoNeckPain")
    end
  }
}
