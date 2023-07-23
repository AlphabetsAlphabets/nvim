local color = "light"

return {
  {
    'NTBBloodbath/sweetie.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.bg = color
      vim.cmd.colorscheme("gruvbox")
      vim.cmd.colorscheme("sweetie")
    end,
  },
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nord")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.bg = color
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
