-- for quotes
math.randomseed(os.time())

-- colorscheme config
require("solarized"):setup({
  config = {
    theme = 'neovim'
  }
})

Cmd("colorscheme " .. Theme)
O.statusline = "%l:%c/%L (%p%%) %=%f"

Cmd("highlight! StatusLine guifg=#002b36 guibg=#859900")
Cmd("highlight! StatusLineNC guifg=#002b36 guibg=#859900")

-- For VimTex
Cmd("filetype plugin indent on")


-- Netrw
G.loaded_netrw = 1
G.loaded_netrwPlugin = 1
G.netrw_banner = 0
G.netrw_liststyle = 0
G.netrw_bufsettings = "nu rnu"

O.smartcase = true
O.errorbells = false
O.visualbell = false
O.swapfile = false
O.hidden = true
O.wildmenu = true
O.signcolumn = "auto"
O.hlsearch = false

O.wrap = false
O.clipboard = "unnamedplus"

-- standard
Cmd("set nu rnu")
O.foldmethod = "manual"
O.scrolloff = 20
Map("n", "<SPACE>", "<Nop>", {})
G.mapleader = " "
O.mouse = ""

O.syntax = 'enable'
O.showmatch = true
-- O.colorcolumn = '80'
O.ignorecase = true
O.smartcase = true
O.shortmess = 'c'

-- basic text editing
O.visualbell = true
O.smartindent = true

O.expandtab = true
O.shiftwidth = 4
O.tabstop = 4
O.softtabstop = 4
