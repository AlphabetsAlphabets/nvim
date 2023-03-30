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
    width = 136,
    minSideBufferWidth = 10,
    colors = { blend = 0.3 }
})
