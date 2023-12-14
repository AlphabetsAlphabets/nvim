local color = "dark"

return {
  {
    {
      "jesseleite/nvim-noirbuddy",
      lazy = false,
      dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" },
      config = function()
        require('noirbuddy').setup {
          colors = {
            primary = '#6EE2FF',
            secondary = '#267FB5',
          },
          preset = 'slate',
        }
      end,
    },
  },
}
