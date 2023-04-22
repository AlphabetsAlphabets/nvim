local lir = require("lir")
local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'

local delete_marked = function()
    local ctx = lir.get_context()
    local items = ctx:get_marked_items() or ctx:current()
    for item in ipairs(items) do
      actions.delete(item)
    end
end

local mappings = {
  ['l']     = actions.edit,
  ['<C-s>'] = actions.split,
  ['<C-v>'] = actions.vsplit,
  ['<C-t>'] = actions.tabedit,
  ['h']     = actions.up,
  ['q']     = actions.quit,
  ['M']     = actions.mkdir,
  ['N']     = actions.newfile,
  ['R']     = actions.rename,
  ['@']     = actions.cd,
  ['Y']     = actions.yank_path,
  ['.']     = actions.toggle_show_hidden,
  ['D']     = actions.delete,
  ['J']     = function()
    mark_actions.toggle_mark()
  end,
  ['C']     = clipboard_actions.copy,
  ['X']     = clipboard_actions.cut,
  ['P']     = clipboard_actions.paste,
  ['Z']     = function()
    delete_marked()
  end
}

lir.setup {
  show_hidden_files = true,
  ignore = { ".git" },
  devicons = { highlight_dirname = true },
  mappings = mappings,
  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = true
    },
  },
  hide_cursor = true
}
