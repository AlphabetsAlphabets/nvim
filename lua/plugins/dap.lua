local dap = require('dap')
local adapters = dap.adapters;
local config = dap.configurations

local dapui = require("dapui")
dapui.setup()

-- Configure DAP ui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup()


adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = '/home/yjh/lsps/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

config.rust = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",

    stopAtEntry = true,
    cwd = '${workspaceFolder}',

    MIMode = 'gdb',
    miDebuggerPath = '/home/yjh/.cargo/bin/rust-gdb',

    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  }
}

