local lush = require('lush')
local hsl = lush.hsl

-- https://coolors.co/1c1d21-2d3a53-0e285c-fffce8-5fa8d3-9a9621

local background = hsl("#1C1D21")
local text = hsl("#eceff4")
local pmenu_bg = hsl("#2D3A53")
local bgSecondary = hsl("#0E285C")
local fg = hsl("#5FA8D3")

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    Normal { bg = background, fg = text }, -- Normal text
    NormalFloat { Normal },                -- Normal text in floating windows.
    DiffText { Normal, bg = background },
    DiffDelete { fg = "#d75f5f", bg = background },
    DiffChange { fg = "#FFF700", bg = background },
    DiffAdd { fg = "#39A839", bg = background },
    VertSplit {}, -- Column separating vertically split windows
    FoldColumn   { }, -- 'foldcolumn'
    SignColumn   { }, -- Column where |signs| are displayed
    Search { bg = bgSecondary, fg = fg, bold = true }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    Folded { Search },                                 -- Line used for closed folds
    IncSearch { Search },                              -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute { Search },                             -- |:substitute| replacement text highlighting
    LineNr { fg = fg },                                -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { Search },                           -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen { Search },                             -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    CursorColumn {}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine {},   -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    NormalNC     { }, -- normal text in non-current windows
    Pmenu { bg = pmenu_bg },                -- Popup menu: Normal item.
    PmenuSel { bg = pmenu_bg.lighten(20) }, -- Popup menu: Selected item.

    WildMenu {},
    PmenuSbar { gui = "reverse" },          -- Popup menu: Scrollbar.
    PmenuThumb { gui = "reverse" },         -- Popup menu: Thumb of the scrollbar.
    Question { Normal },                    -- |hit-enter| prompt and yes/no questions
    QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { bg=background, fg=fg }, -- Tab pages line, not active tab page label
    TabLineFill  {}, -- Tab pages line, where there are no labels
    TabLineSel   { fg=background, bg=fg }, -- Tab pages line, active tab page label
    StatusLine { bg=background, fg=fg },
    Title        { }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual { Search, gui = "reverse" },     -- Visual mode selection
    Constant { fg = "#45B39D" }, -- (*) Any constant
    Identifier { fg = "#58C6BE" }, -- (*) Any variable name
    Statement { fg = fg }, -- (*) Any statement
    PreProc { fg = "#7BD07E" }, -- (*) Generic Preprocessor
    Type { fg = "#87DBFF" }, -- (*) int, long, char, etc.
    Special { Normal }, -- (*) Any special symbol
    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Todo { Search }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme
