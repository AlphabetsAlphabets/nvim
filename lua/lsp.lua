local debugging = {
  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  'rcarriga/nvim-dap-ui',
  'simrat39/rust-tools.nvim',
}

local lsp = {
  "filipdutescu/renamer.nvim",
  "iurimateus/luasnip-latex-snippets.nvim",
  "latex-lsp/texlab",

  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'hrsh7th/nvim-cmp',
      "petertriho/cmp-git",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("cmp_git").setup()

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and
            vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local mappings = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }

      local sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'git' }, -- Git completion
      }

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert(mappings),
        sources = cmp.config.sources(sources),
      }

      local servers = { "ccls", "rust_analyzer", "pyright", "lua_ls", "hls" }

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
      local function do_rename(win)
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
        vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', string.format(fmt, win) .. "<ESC>l",
          { silent = true })
        vim.api.nvim_buf_set_keymap(buf, 'i', '<C-c>', "<cmd>q<CR><Esc>w", { silent = true })
        vim.api.nvim_buf_set_keymap(buf, 'n', '<C-c>', "<cmd>q<CR><Esc>w", { silent = true })
      end

      _G.Rename = {
        rename = rename,
        dorename = do_rename
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
        vim.keymap.set("n", "K", lsp.buf.hover)
        vim.keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>")
        vim.keymap.set("n", "<leader>gd", ":Telescope lsp_definitions<CR>")

        vim.keymap.set('n', '<leader>rn', '<cmd>lua Rename.rename()<CR>$a', { silent = true })
        vim.keymap.set("n", "<leader>ji", lsp.buf.implementation)

        vim.keymap.set("n", "<leader>s", ":Telescope lsp_document_symbols<CR>")
        vim.keymap.set("n", "<leader>S", ":Telescope lsp_workspace_symbols query=")

        vim.keymap.set("n", "[qd", vim.diagnostic.setqflist)
        vim.keymap.set('n', "[e", vim.diagnostic.open_float)

        vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)

        vim.keymap.set("n", "<leader>e", lsp.buf.format)
        vim.keymap.set("n", "<leader>lca", lsp.buf.code_action)
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
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
        },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    keys = {
      { "[tt",        "<cmd>TroubleToggle<cr>",                       { silent = true, noremap = true } },
      { "[tw",        "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true } },
      { "[td",        "<cmd>TroubleToggle document_diagnostics<cr>",  { silent = true, noremap = true } },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               { silent = true, noremap = true } },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              { silent = true, noremap = true } },
      { "gR",         "<cmd>TroubleToggle lsp_references<cr>",        { silent = true, noremap = true } },
    },
    config = function()
      require("trouble").setup({ icons = false })
    end
  },
}

return {
  debugging,
  lsp,
}
