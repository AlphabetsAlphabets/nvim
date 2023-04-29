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
    minSideBufferWidth = 15,
    colors = { blend = 0.3 }
})
