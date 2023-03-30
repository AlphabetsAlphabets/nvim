local navic = require("nvim-navic")

require('lualine').setup {
	options = { theme = 'nord' },
    sections = {
        lualine_c = {
            { navic.get_location, cond = navic.is_available },
        }
    }
}
