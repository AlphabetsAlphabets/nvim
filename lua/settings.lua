-- Statusline
vim.opt.statusline = "%m %l:%c/%L (%p%%) %=%f"

-- For VimTex
vim.cmd("filetype plugin indent on")

-- By default searches are case insensitive unless an uppercase is
-- included in the search. This is annoying so this makes all searches
-- case insensitive.
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Hazard safety.
--
-- If changes are made to hidden buffers and they are unsaved.
-- Setting this to true will ask if you want to save changes.
vim.opt.hidden = true
-- If for some reason power is cut or lost, unsaved changes are not lost.
-- The help file says to not use for big files
vim.opt.swapfile = false

-- Removes <ENTER> to continue prompts
vim.opt.shortmess = 'c'

-- Stops the beeping sound when an error occurs
-- vim.opt.visualbell = true
-- vim.opt.errorbells = false

-- Leader key
vim.keymap.set("n", "<SPACE>", "<Nop>", {})
vim.g.mapleader = " "
vim.opt.mouse = ""

-- Provides better readability
vim.opt.syntax = 'enable'
vim.opt.foldmethod = "manual"
vim.opt.scrolloff = 20
vim.opt.wrap = false

-- Navigation
vim.cmd("set nu rnu")

-- Editing
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.signcolumn = "auto"
vim.opt.hlsearch = false

-- Creats a tab list you can tab through
vim.opt.wildmenu = true

-- Show matching brackets by highlighting the closing/opening pair
vim.opt.showmatch = true

-- Convenience
vim.opt.clipboard = "unnamedplus"
