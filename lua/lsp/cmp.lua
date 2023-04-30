local cmp = require("cmp")
require("cmp_nvim_ultisnips").setup({})
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

local mappings = {
  ['<C-u>'] = cmp.mapping.scroll_docs(-4),   -- Up
  ['<C-d>'] = cmp.mapping.scroll_docs(4),    -- Down
  -- C-b (back) C-f (forward) for snippet placeholder navigation.
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  ['<Tab>'] = cmp.mapping(
    function(fallback)
      cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
    end,
    { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
  ),
  ['<S-Tab>'] = cmp.mapping(
    function(fallback)
      cmp_ultisnips_mappings.jump_backwards(fallback)
    end,
    { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
  ),
}

local sources = {
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'git' }, -- Git completion
}

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert(mappings),
  sources = sources,
}

require("cmp_git").setup()
