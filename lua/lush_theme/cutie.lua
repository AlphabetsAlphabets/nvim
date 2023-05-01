---@diagnostic disable: undefined-global

vim.cmd("hi clear")
local lush = require('lush')
local hsl = lush.hsl

-- Basic colors
local bg = hsl("#212121").darken(65)
local fg = hsl("#5FA8D3").darken(20)
local text = hsl("#eceff4").darken(20)

-- pmenu
local pmenu_bg = hsl("#2D3A53").darken(20)
local search_bg = hsl("#0E285C").darken(20)

-- diffs
local delete = hsl("#d75f5f")
local change = hsl("#FFF700").darken(25)
local add = hsl("#39A839")

-- Syntax items (look at :h group-name)
local constant = hsl("#45b39d")
local identifier = hsl("#58c6be")
local preproc = hsl("#7bd07e")
local type = hsl("#87dbff")

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    Normal { bg = bg, fg = text }, -- Normal text
    NormalFloat { Normal },        -- Normal text in floating windows.

    DiffText { Normal, bg = bg },
    DiffDelete { fg = delete, bg = bg },
    DiffChange { fg = change, bg = bg },
    DiffAdd { fg = add, bg = bg },
    VertSplit {},                                    -- Column separating vertically split windows

    FoldColumn {},                                   -- 'foldcolumn'
    SignColumn {},                                   -- Column where |signs| are displayed

    Search { bg = search_bg, fg = fg, bold = true }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    Folded { Search },                               -- Line used for closed folds
    IncSearch { Search },                            -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute { Search },                           -- |:substitute| replacement text highlighting
    LineNr { fg = fg },                              -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { Search },                         -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen { Search },                           -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    CursorColumn {},                                 -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine {},                                   -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    NormalNC {},                                     -- normal text in non-current windows
    Pmenu { bg = pmenu_bg },                         -- Popup menu: Normal item.
    PmenuSel { bg = pmenu_bg.lighten(20) },          -- Popup menu: Selected item.

    WildMenu {},
    PmenuSbar { gui = "reverse" },      -- Popup menu: Scrollbar.
    PmenuThumb { gui = "reverse" },     -- Popup menu: Thumb of the scrollbar.
    -- Question { Normal },                    -- |hit-enter| prompt and yes/no questions
    QuickFixLine {},                    -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    StatusLineNC {},                    -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine { bg = bg, fg = fg },       -- Tab pages line, not active tab page label
    TabLineFill {},                     -- Tab pages line, where there are no labels
    TabLineSel { fg = bg, bg = fg },    -- Tab pages line, active tab page label
    StatusLine { bg = bg, fg = fg },
    Title {},                           -- Titles for output from ":set all", ":autocmd" etc.
    Visual { Search, gui = "reverse" }, -- Visual mode selection
    Underlined { gui = "underline" },   -- Text that stands out, HTML links
    Todo { Search },                    -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- More info at :h group-name
    Constant { fg = constant.lighten(50) },    -- (*) Any constant
    Identifier { fg = identifier }, -- (*) Any variable name
    PreProc { fg = preproc },      -- (*) Generic Preprocessor
    Type { fg = type },            -- (*) int, long, char, etc.
    Statement { fg = fg.lighten(80) },         -- (*) Any statement
    Special { fg = fg },            -- (*) Any special symbol

  }

  --- hello
end)

-- Return our parsed theme for extension or use elsewhere.
return theme
