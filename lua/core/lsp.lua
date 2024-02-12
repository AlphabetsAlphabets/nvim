local lspconfig = require("lspconfig")
vim.opt.completeopt = { "longest", "menuone", "popup" }

local servers = { "rust_analyzer", "pyright", "lua_ls", "clangd" }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
    }
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev) 
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        -- Hover shows information about symbol like type
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        -- Diagnostics show the errors only
        vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    end
    }
)
