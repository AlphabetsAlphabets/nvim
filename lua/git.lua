return {
  'tpope/vim-fugitive',
  {
    'pwntester/octo.nvim',
    config = function()
      require("octo").setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = "BufWinEnter",
    keys = {
      { "[c", "<cmd>lua require'gitsigns'.next_hunk()<CR>" },
      { "]c", "<cmd>lua require'gitsigns'.prev_hunk()<CR>" },
      { "{c", "<cmd>lua require'gitsigns'.next_hunk({preview = true})<CR>" },
      { "}c", "<cmd>lua require'gitsigns'.prev_hunk({preview = true})<CR>" },
      { "[s", "<cmd>lua require'gitsigns'.preview_hunk_inline()<CR>" },
      { "[S", "<cmd>lua require'gitsigns'.setqflist()<CR>" },
    },
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    'TimUntersberger/neogit',
    config = function()
      require("neogit").setup {
        integrations = {
          diffview = true,
          telescope = true
        }
      }
    end
  },
  'sindrets/diffview.nvim',
}
