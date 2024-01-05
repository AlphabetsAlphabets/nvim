return {
  {
    "mrjones2014/legendary.nvim",
    dependencies = { "stevearc/dressing.nvim" },
    priority = 10000,
    lazy = false,
    config = function()
      require("legendary").setup({
        keymaps = require("keymaps"),
        autocmds = require("autocmds")
      })
    end
  }
}
