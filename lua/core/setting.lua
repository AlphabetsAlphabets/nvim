-- Statusline
O.statusline = "%m %l:%c/%L (%p%%) %=%f"
O.conceallevel = 3


-- For VimTex
Cmd("filetype plugin indent on")

-- Netrw
-- Uncommenting these two will disable netrw
-- when a filebrowsing plugin is used.
-- G.loaded_netrw = 1
-- G.loaded_netrwPlugin = 1
-- G.netrw_banner = 0
-- G.netrw_liststyle = 3
-- G.netrw_bufsettings = "nu rnu"

-- By default searches are case insensitive unless an uppercase is
-- included in the search. This is annoying so this makes all searches
-- case insensitive.
O.smartcase = true
O.ignorecase = true

-- Hazard safety.
--
-- If changes are made to hidden buffers and they are unsaved.
-- Setting this to true will ask if you want to save changes.
-- O.hidden = true
-- If for some reason power is cut or lost, unsaved changes are not lost.
-- The help file says to not use for big files
-- O.swapfile = false

-- Removes <ENTER> to continue prompts
O.shortmess = 'c'

-- Stops the beeping sound when an error occurs
-- O.visualbell = true
-- O.errorbells = false

-- Leader key
Map("n", "<SPACE>", "<Nop>", {})
G.mapleader = " "
O.mouse = ""

-- Provides better readability
O.syntax = 'enable'
O.foldmethod = "manual"
O.scrolloff = 20
O.wrap = false

-- Navigation
Cmd("set nu rnu")

-- Editing
O.smartindent = true
O.expandtab = true
O.softtabstop = 4
O.shiftwidth = 4
O.tabstop = 4

O.signcolumn = "auto"
O.hlsearch = false

-- Creats a tab list you can tab through
O.wildmenu = true

-- Show matching brackets by highlighting the closing/opening pair
O.showmatch = true

-- Convenience
O.clipboard = "unnamedplus"
