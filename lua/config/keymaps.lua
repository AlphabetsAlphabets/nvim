--- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- [[ Core keymaps  ]]

Cmd([[ nnoremap <expr> k (v:count >= 5 ? "m'" . v:count : "") . 'k' ]])
Cmd([[ nnoremap <expr> j (v:count >= 5 ? "m'" . v:count : "") . 'j' ]])

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Misc
Map("n", "<Space>", "<Nop>", {})
Map("n", "<C-c>", "<cmd>nohl<CR>", {})
Map("n", "<leader>z", "<cmd>NoNeckPain<CR>", {})
Map("n", "<leader><leader>x", ":wa | so %<CR>", {})

-- Windows
--- Window navigation
Map("n", "<A-c>", ":close<CR>", {}) -- Close floating windows
Map("n", "<A-q>", ":q<CR>", {})
Map("n", "<C-f>", ":on<CR>", {})
Map("n", "<A-a>", "<C-w>h", {})
Map("n", "<A-s>", "<C-w>j", {})
Map("n", "<A-w>", "<C-w>k", {})
Map("n", "<A-d>", "<C-w>l", {})

--- Resizing window
Map("n", "<A-n>", "<C-w>=", {})
Map("n", "<A-A>", "<C-w>h<C-w>|", {})
Map("n", "<A-S>", "<C-w>j<C-w>_", {})
Map("n", "<A-W>", "<C-w>k<C-w>_", {})
Map("n", "<A-D>", "<C-w>l<C-w>|", {})

-- Quick fix
Map("n", "[qc", ":ccl<CR>", {})
Map("n", "[qo", ":copen<CR>", {})

Map("n", "<leader>.", "5<C-w>>", {})
Map("n", "<leader>,", "5<C-w><", {})

--- Movement
Map("n", "s", "$", {})
Map("n", "S", "^", {})

Map("v", "s", "$", {})
Map("v", "S", "^", {})

Map("n", "{", "}", { noremap = true })
Map("n", "{", "}", { noremap = true })

Map("v", "}", "{", { noremap = true })
Map("v", "}", "{", { noremap = true })

Map("v", "<A-j>", "<C-d>", {})
Map("v", "<A-k>", "<C-u>", {})

Map("n", "<A-j>", "<C-d>", {})
Map("n", "<A-k>", "<C-u>", {})

Map("v", "<A-j>", "<C-d>", {})
Map("v", "<A-k>", "<C-u>", {})

-- Project navigation
Map("n", "<leader>gor", ":silent !gh repo view --web<CR>", {}) -- send pane to new tab
Map("n", "<leader>tt", "<C-w>T", {})                           -- send pane to new tab
Map("n", "<C-w>n", ":tabnew<cr>", {})

Map("n", "<C-k>", ":tabprevious<cr>", {})
Map("n", "<C-j>", ":tabnext<cr>", {})
Map("n", "<C-q>", ":tabclose<cr>", {})

Map("n", "<leader><leader>h", ":echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>", {})

-- [[ DAP, debugging ]]

local dap = require("dap")

Map("n", "<F1>", dap.continue)
Map("n", "<leader>dx", dap.terminate)
Map("n", "<F10>", dap.step_into)
Map("n", "<F11>", dap.step_over)
Map("n", "<F7>", dap.step_out)

Map("n", "<leader>k", function()
	require("dap.ui.widgets").hover()
end)

-- Also hover but opens a window for it instead.
Map("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)

Map("n", "<leader>dp", require("dap.ui.widgets").preview)

-- Variables in scope. Maybe make this in a separate window?
-- Look at help for centered_float
Map("n", "<leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

Map("n", "<A-b>", dap.toggle_breakpoint)
Map("n", "<leader>fab", dap.clear_breakpoints)

Map("n", "<leader>ro", dap.repl.open)

-- [[ Trouble, diagnostics ]]

Map("n", "[tt", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
Map("n", "[tw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
Map("n", "[td", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
Map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
Map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
Map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

-- [[ Oil, file, file browsing ]]

Map("n", "<A-o>", "<cmd>Oil .<CR>", {})

-- [[ Telescope, file, file browsing ]]

Map("n", "<leader>fd", ":Telescope current_buffer_fuzzy_find<cr>", {})
Map("n", "<leader>ht", ":Telescope help_tags<cr>", {})
Map("n", "<leader>rg", ":Telescope live_grep<cr>", {})
Map("n", "<leader>fb", ":Telescope buffers<cr>", {})
Map("n", "<leader>gb", ":Telescope git_branches<cr>", {})
Map("n", "<leader>glb", ":Telescope git_stash<cr>", {})

-- FZF integration
Map("n", "<leader>ff", function()
	local builtin = require("telescope.builtin")
	local args = {
		find_command = { 
			'rg', '--files', '--hidden',
			'--glob', '!**/.ccls-cache/*',
			'--glob', '!**/.git/*'
		}
	}
	builtin.find_files(args)
end, {})
