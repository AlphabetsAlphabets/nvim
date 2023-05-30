require("no-neck-pain").setup({
    autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
    },
    buffers = {
      right = {
        enabled = false,
      },
    },
    width = 100,
    colors = { blend = 0.3 }
})
