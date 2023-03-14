local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "ccls", "rust_analyzer", "pyright", "lua_ls" }

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

local on_attach = function(client, bufnr)
	local lsp = vim.lsp

  local diag_opts = {
    virtual_text = false,
    float = {
      border = 'rounded',
    }
  }

  vim.diagnostic.config(diag_opts)

	Map("n", "K", lsp.buf.hover)
	Map("n", "<leader>fr", ":Telescope lsp_references<CR>")
	Map("n", "<leader>gd", ":Telescope lsp_definitions<CR>")

	Map("n", "<leader>rn", lsp.buf.rename)
	Map("n", "<leader>ji", lsp.buf.implementation)

	Map("n", "<leader>s", ":Telescope lsp_workspace_symbols<CR>")
	Map("n", "<leader>S", ":Telescope lsp_document_symbols<CR>")

	Map("n", "[qd", vim.diagnostic.setqflist)
  Map('n', "[e", vim.diagnostic.open_float)

	Map("n", "[d", vim.diagnostic.goto_next)
	Map("n", "]d", vim.diagnostic.goto_prev)

	Map("n", "<leader>e", lsp.buf.format)
	Map("n", "<leader>ca", lsp.buf.code_action)
end


-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		handlers = handlers,
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
