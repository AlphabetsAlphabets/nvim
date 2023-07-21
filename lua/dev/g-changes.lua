local gitsigns = require('gitsigns')
local hunks = gitsigns.get_hunks()
print(vim.inspect(hunks))
