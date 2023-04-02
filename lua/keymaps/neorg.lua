Map("n", "<LocalLeader>li", function() 
  vim.cmd("Neorg workspace notes")
  vim.cmd("Neorg index")
end, {})
Map("n", "<LocalLeader>nn", ":Neorg keybind all core.norg.dirman.new.note<CR>", {})
Map("n", "<LocalLeader>nr", ":Neorg return<CR>", {})
Map("n", "<LocalLeader>tc", ":Neorg toggle-concealer<CR>", {})
Map("n", "<LocalLeader>toc", ":Neorg toc<CR>", {})

-- Diary
Map("n", "<LocalLeader>jtdy", "<Cmd>Neorg journal today<CR>", {})
Map("n", "<LocalLeader>jtmr", "<Cmd>Neorg journal tommorrow<CR>", {})
Map("n", "<LocalLeader>jytd", "<Cmd>Neorg journal yesterday<CR>", {})

-- Telescope + Neorg
Map("n", "<LocalLeader>ff", ":Telescope neorg find_norg_files<CR>", {})
Map("n", "<LocalLeader>sh", ":Telescope neorg search_headings<CR>", {})
Map("n", "<LocalLeader>fl", ":Telescope neorg find_linkable<CR>", {})
