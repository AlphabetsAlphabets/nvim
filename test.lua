local hl = function(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

vim.api.nvim_set_hl(0, "CmpBorder", {})
vim.api.nvim_set_hl(0, "CmpNormal", {})
print("Sourced")
