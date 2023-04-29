local gdb = require("gdb")

local opts = {
  default_to_buf = true,
  detect_binary = true,
}

gdb.setup(opts)
