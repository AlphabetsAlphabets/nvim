local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "ccls", "rust_analyzer", "pyright", "lua_ls", "hls", "gopls" }

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- Forgot where I got this. But it's from some reddit comment.
local function dorename(win)
  local new_name = vim.trim(vim.fn.getline('.'))
  vim.api.nvim_win_close(win, true)
  vim.lsp.buf.rename(new_name)
end

local function rename()
  local opts = {
    relative = 'cursor',
    row = 0,
    col = 0,
    width = 30,
    height = 1,
    style = 'minimal',
    border = 'rounded'
  }

  local cword = vim.fn.expand('<cword>')
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, opts)
  local fmt =  '<cmd>lua Rename.dorename(%d)<CR>'

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {cword})
  vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', string.format(fmt, win) .. "<ESC>l", {silent=true})
  vim.api.nvim_buf_set_keymap(buf, 'i', '<C-c>', "<cmd>q<CR><Esc>w", {silent=true})
  vim.api.nvim_buf_set_keymap(buf, 'n', '<C-c>', "<cmd>q<CR><Esc>w", {silent=true})

  local twotwenty = 20
  local z = twotwenty + 2
end

_G.Rename = {
   rename = rename,
   dorename = dorename
}

local on_attach = function(client, bufnr)
  local lsp = vim.lsp

  local diag_opts = {
    float = {
      border = 'rounded',
    }
  }

  vim.diagnostic.config(diag_opts)

  -- Keymaps
  Map("n", "K", lsp.buf.hover)
  Map("n", "<leader>fr", ":Telescope lsp_references<CR>")
  Map("n", "<leader>gd", ":Telescope lsp_definitions<CR>")

  Map('n', '<leader>rn', '<cmd>lua Rename.rename()<CR>$a', { silent = true })
  Map("n", "<leader>ji", lsp.buf.implementation)

  Map("n", "<leader>s", ":Telescope lsp_document_symbols<CR>")
  Map("n", "<leader>S", ":Telescope lsp_workspace_symbols query=")

  Map("n", "[qd", vim.diagnostic.setqflist)
  Map('n', "[e", vim.diagnostic.open_float)

  Map("n", "[d", vim.diagnostic.goto_next)
  Map("n", "]d", vim.diagnostic.goto_prev)

  Map("n", "<leader>e", lsp.buf.format)
  Map("n", "<leader>ca", lsp.buf.code_action)
end

-- LSP settings (for overriding per client)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
