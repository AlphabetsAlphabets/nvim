require("solarized"):setup({
  config = {
    theme = 'neovim'
  }
})

-- fg is the text color and bg is bg color
local colorscheme = G.colors_name
if colorscheme == "solarized" then

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
end
