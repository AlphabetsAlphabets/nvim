vim.cmd("highlight clear")

vim.cmd("set t_Co=256")
vim.cmd("let g:colors_name='muted'")

local colors = {
  -- content here will not be touched
  -- PATCH_OPEN
  Normal = {fg = "#AEBBD0", bg = "#0D0D0D"},
  NormalFloat = {link = "Normal"},
  Constant = {fg = "#A3DBD0"},
  CursorColumn = {},
  CursorLine = {},
  DiffAdd = {fg = "#39A739", bg = "#0D0D0D"},
  DiffChange = {fg = "#C2BB00", bg = "#0D0D0D"},
  DiffDelete = {fg = "#D76060", bg = "#0D0D0D"},
  DiffText = {fg = "#AEBBD0", bg = "#0D0D0D"},
  FoldColumn = {},
  Identifier = {fg = "#58C6BE"},
  LineNr = {fg = "#358DC0"},
  NormalNC = {},
  Pmenu = {bg = "#242E42"},
  PmenuSbar = {reverse = true},
  PmenuSel = {bg = "#405477"},
  PmenuThumb = {reverse = true},
  PreProc = {fg = "#7CD07F"},
  QuickFixLine = {},
  Search = {fg = "#358DC0", bg = "#0B214B", bold = true},
  CursorLineNr = {link = "Search"},
  Folded = {link = "Search"},
  IncSearch = {link = "Search"},
  MatchParen = {link = "Search"},
  Substitute = {link = "Search"},
  Todo = {link = "Search"},
  SignColumn = {},
  Special = {fg = "#358DC0"},
  Statement = {fg = "#D7E9F4"},
  StatusLine = {fg = "#358DC0", bg = "#0D0D0D"},
  StatusLineNC = {},
  TabLine = {fg = "#358DC0", bg = "#0D0D0D"},
  TabLineFill = {},
  TabLineSel = {fg = "#0D0D0D", bg = "#358DC0"},
  Title = {},
  Type = {fg = "#85DAFF"},
  Underlined = {underline = true},
  VertSplit = {},
  Visual = {fg = "#358DC0", bg = "#0B214B", bold = true, reverse = true},
  WildMenu = {},
  -- PATCH_CLOSE
  -- content here will not be touched
}


-- apply highlight groups
for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end
