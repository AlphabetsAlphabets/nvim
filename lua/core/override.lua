require("solarized"):setup({
  config = {
    theme = 'neovim'
  }
})

local hl = function(group, val)
  Api.nvim_set_hl(0, group, val)
end

-- This is for the solarised theme
-- fg is the text color and bg is bg color

-- Statusline
hl("StatusLine", {fg="#002b36", bg="#859900"})
hl("StatusLineNC", {fg="#859900", bg="#002b36"})

-- Tab overrides
hl("Title", {fg="#fdf6e3"})
hl("TabLine", {fg="#859900", bg="#002b36"})
hl("TabLineSel", {fg="#002b36", bg="#859900"})
