local navic = require("nvim-navic")

require('lualine').setup {
	options = { theme = Theme },
    sections = {
        lualine_c = {
            { navic.get_location, cond = navic.is_available },
        }
    }
}
