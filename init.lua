require('core')
require('plugins')
require('keymaps')
require('lsp')

local autocmd_files = {
  -- "folds.vim"
}

local autocommands = "source /home/yjh/.config/nvim/autocommands/"
for _, v in ipairs(autocmd_files) do 
  Cmd(autocommands .. v)
end
