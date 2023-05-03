local dap = require('dap')
local adapters = dap.adapters;

-- C++
adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = '/home/yjh/lsps/codelldb/extension/adapter/codelldb',
    args = { "--port", "${port}" },
  }
}


-- C#
dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/bin/netcoredbg',
  args = {'--interpreter=vscode'}
}
