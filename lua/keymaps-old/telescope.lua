Map("n", "<leader>fd", ":Telescope current_buffer_fuzzy_find<cr>", {})
Map("n", "<leader>ht", ":Telescope help_tags<cr>", {})
Map("n", "<leader>rg", ":Telescope live_grep<cr>", {})
Map("n", "<leader>fb", ":Telescope buffers<cr>", {})
Map("n", "<leader>gb", ":Telescope git_branches<cr>", {})
Map("n", "<leader>glb", ":Telescope git_stash<cr>", {})

-- FZF integration
Map("n", "<leader>ff", function()
	local builtin = require("telescope.builtin")
	local args = {
		find_command = { 
			'rg', '--files', '--hidden',
			'--glob', '!**/.ccls-cache/*',
			'--glob', '!**/.git/*'
		}
	}
	builtin.find_files(args)
end, {})
