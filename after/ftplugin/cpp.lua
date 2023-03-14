vim.api.nvim_create_user_command("Make", function()
	vim.cmd("!cmake -S . -B build/")
	vim.cmd("!make -C build/")
end, {})
