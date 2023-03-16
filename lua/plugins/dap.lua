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


adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = '/home/yjh/lsps/codelldb/extension/adapter/codelldb',
    args = { "--port", "${port}" },
  }
}

config.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
