require('core')
require('plugins')
-- require('keymaps')
require('lsp')

local autocmd_files = {
  "folds.vim"
}

local autocommands = "/home/yjh/.config/nvim/autocommands/"
for _, file in ipairs(autocmd_files) do
  Cmd("source " .. autocommands .. file)
end

Cmd([[set background=light]])
Cmd([[colo gruvbox]])
Cmd([[colo sweetie]])
