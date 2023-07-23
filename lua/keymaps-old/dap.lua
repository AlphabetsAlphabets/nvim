local dap = require("dap")

Map("n", "<F1>", dap.continue)
Map("n", "<leader>dx", dap.terminate)
Map("n", "<F10>", dap.step_into)
Map("n", "<F11>", dap.step_over)
Map("n", "<F7>", dap.step_out)

Map("n", "<leader>k", function()
	require("dap.ui.widgets").hover()
end)

-- Also hover but opens a window for it instead.
Map("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)

Map("n", "<leader>dp", require("dap.ui.widgets").preview)

-- Variables in scope. Maybe make this in a separate window?
-- Look at help for centered_float
Map("n", "<leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

Map("n", "<A-b>", dap.toggle_breakpoint)
Map("n", "<leader>fab", dap.clear_breakpoints)

Map("n", "<leader>ro", dap.repl.open)
