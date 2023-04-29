math.randomseed(os.time())

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'maxmx03/solarized.nvim',

  -- Telescope
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'kyazdani42/nvim-web-devicons',
  'stevearc/oil.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Git integration
  'pwntester/octo.nvim',
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',

  -- LSP
  'petertriho/cmp-git',

  'neovim/nvim-lspconfig',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  "folke/trouble.nvim",

  -- LSP tools
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    'filipdutescu/renamer.nvim',
    branch = 'master'
  },

  -- Debugging
  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  'rcarriga/nvim-dap-ui',
  'simrat39/rust-tools.nvim',
  'shortcuts/no-neck-pain.nvim',

  -- Misc
  'neoclide/jsonc.vim',   -- Syntax higlighting
  'tpope/vim-commentary', -- Bulk commenting
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local opts = require("plugins.dashboard")
      require("dashboard").setup {
        theme = 'doom',
        hide = { statusline = true },
        config = {
          header = opts.header,
          footer = { opts.footer },
          center = {
            {
              desc = '',
            },
          },
        }
      }
    end,
  },
})
