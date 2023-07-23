-- fg is the text color and bg is bg color

local theme = G.Theme
if theme == "solarized" then
  require("solarized"):setup({
    config = {
      theme = 'neovim'
    }
  })

  -- Statusline
  --
  -- The active and inactive tabs respecctively
  Hl("StatusLine", { fg = "#002b36", bg = "#859900" })
  Hl("StatusLineNC", { fg = "#859900", bg = "#002b36" })

  -- Tab overrides

  -- Changes the color of the number beside the file's name when
  -- there are multiple tabs and one of them has mutliple windows open
  Hl("Title", { fg = "#fdf6e3" })

  -- The active and inactive colors of tabs repsectively
  Hl("TabLineSel", { fg = "#002b36", bg = "#859900" })
  Hl("TabLine", { fg = "#859900", bg = "#002b36" })
elseif theme == "nord" then
  Cmd("colorscheme " .. theme)

  Hl("StatusLine", { fg = "#000000", bg = "#d8dee9" })
elseif theme == "sweetie" then
  Cmd("set background=light")
  Cmd("colorscheme habamax")
  Cmd("colorscheme " .. theme)
else
  Cmd("colorscheme " .. theme)
end
