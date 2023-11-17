local color = "dark"

return {
  {
    'NTBBloodbath/sweetie.nvim',
    lazy = true,
    priority = 1000,
    config = function()
      vim.o.bg = color
      vim.cmd.colorscheme("gruvbox")
      vim.cmd.colorscheme("sweetie")
    end,
  },
  {
    'shaunsingh/nord.nvim',
    lazy = true,
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
  {
    "NTBBloodbath/daylight.nvim",
    lazy = true,
    config = function()
      require("daylight").setup({
        day = {
          name = "sweetie",
          time = 8, -- 8 am
        },
        night = {
          name = "gruvbox",
          time = 19,      -- 7 pm, changes to dark theme on 07:01
        },
        interval = 60000, -- Time in milliseconds, 1 minute
      })
    end,
  }
}
