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
    -- FoldColumn   { }, -- 'foldcolumn'
    -- SignColumn   { }, -- Column where |signs| are displayed
    Search { bg = bgSecondary, fg = fg, bold = true }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    Folded { Search },                                 -- Line used for closed folds
    IncSearch { Search },                              -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute { Search },                             -- |:substitute| replacement text highlighting
    LineNr { fg = fg },                                -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { Search },                           -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen { Search },                             -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    -- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- CursorColumn { Normal, gui = "reverse" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine { Normal, gui = "reverse" },   -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu { bg = pmenu_bg },                -- Popup menu: Normal item.
    PmenuSel { bg = pmenu_bg.lighten(20) }, -- Popup menu: Selected item.

    PmenuSbar { gui = "reverse" },          -- Popup menu: Scrollbar.
    PmenuThumb { gui = "reverse" },         -- Popup menu: Thumb of the scrollbar.
    Question { Normal },                    -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- StatusLine   { }, -- Status line of current window
    -- StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { bg=background, fg=fg }, -- Tab pages line, not active tab page label
    -- TabLineFill  { }, -- Tab pages line, where there are no labels
    -- TabLineSel   { }, -- Tab pages line, active tab page label
    Title        { }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual { Search, gui = "reverse" },     -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg   { }, -- Warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu     { }, -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- Comment        { }, -- Any comment

    Constant { fg = "#45B39D" }, -- (*) Any constant
    -- Constant { fg = fg }, -- (*) Any constant
    -- String         { }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier { fg = "#58C6BE" }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

    Statement { fg = fg }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc { fg = "#7BD07E" }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type { fg = "#87DBFF" }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special { Normal }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    Todo { Search }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme
