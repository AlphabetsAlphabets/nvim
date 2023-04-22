local actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
	    preview_height = 0.725,
	    width = 0.55,
    },

    pickers = {
	    find_files = {
		    find_command = {
			    "rg",
			    "--files",
			    "--hidden",
			    "--glob",
			    "!**/.git/*"
		    }
	    }
    },

    set_env = {["COLORTERM"] = "truecolor"},

    color_devicons = true,

    mappings = {
      i = {
        ["<CR>"] = actions.select_default + actions.center,
        ["<C-o>"] = actions.select_tab,
        ["<C-c>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },

    extensions = {
	coc = {
	    theme = 'ivy',
	    prefer_locations = true,
        },
	fzf = {
		fuzzy = true,                    -- false will only do exact matching
		override_generic_sorter = true,  -- override the generic sorter
		override_file_sorter = true,     -- override the file sorter
		case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
	}
    }
  }
}

-- Extensions
--- FZF
require("telescope").load_extension("fzf")
