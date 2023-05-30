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
  local fmt = '<cmd>lua Rename.dorename(%d)<CR>'

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { cword })
  vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', string.format(fmt, win) .. "<ESC>l", { silent = true })
  vim.api.nvim_buf_set_keymap(buf, 'i', '<C-c>', "<cmd>q<CR><Esc>w", { silent = true })
  vim.api.nvim_buf_set_keymap(buf, 'n', '<C-c>', "<cmd>q<CR><Esc>w", { silent = true })
end

_G.Rename = {
  rename = rename,
  dorename = dorename
}

local on_attach = function(client, bufnr)
  -- This is to fix this issue https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1364720374
  if client.name == "omnisharp" then
    client.server_capabilities.semanticTokensProvider = {
      full = vim.empty_dict(),
      legend = {
        tokenModifiers = { "static_symbol" },
        tokenTypes = {
          "comment",
          "excluded_code",
          "identifier",
          "keyword",
          "keyword_control",
          "number",
          "operator",
          "operator_overloaded",
          "preprocessor_keyword",
          "string",
          "whitespace",
          "text",
          "static_symbol",
          "preprocessor_text",
          "punctuation",
          "string_verbatim",
          "string_escape_character",
          "class_name",
          "delegate_name",
          "enum_name",
          "interface_name",
          "module_name",
          "struct_name",
          "type_parameter_name",
          "field_name",
          "enum_member_name",
          "constant_name",
          "local_name",
          "parameter_name",
          "method_name",
          "extension_method_name",
          "property_name",
          "event_name",
          "namespace_name",
          "label_name",
          "xml_doc_comment_attribute_name",
          "xml_doc_comment_attribute_quotes",
          "xml_doc_comment_attribute_value",
          "xml_doc_comment_cdata_section",
          "xml_doc_comment_comment",
          "xml_doc_comment_delimiter",
          "xml_doc_comment_entity_reference",
          "xml_doc_comment_name",
          "xml_doc_comment_processing_instruction",
          "xml_doc_comment_text",
          "xml_literal_attribute_name",
          "xml_literal_attribute_quotes",
          "xml_literal_attribute_value",
          "xml_literal_cdata_section",
          "xml_literal_comment",
          "xml_literal_delimiter",
          "xml_literal_embedded_expression",
          "xml_literal_entity_reference",
          "xml_literal_name",
          "xml_literal_processing_instruction",
          "xml_literal_text",
          "regex_comment",
          "regex_character_class",
          "regex_anchor",
          "regex_quantifier",
          "regex_grouping",
          "regex_alternation",
          "regex_text",
          "regex_self_escaped_character",
          "regex_other_escape",
        },
      },
      range = true,
    }
  end

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
  Map("n", "<leader>lca", lsp.buf.code_action)
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

if OS == "Windows_NT" then
  local omnisharp_bin = "C:\\Users\\yapji\\lsp\\omnisharp\\OmniSharp.dll"

  lspconfig.omnisharp.setup {
    on_attach = on_attach,
    handlers = handlers,
    capabilities = capabilities,
    cmd = { "dotnet", omnisharp_bin },
  }
end
