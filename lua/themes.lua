return {
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic'.load()
    end
  },
  "NTBBloodbath/sweetie.nvim",
}
