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
  -- Themes
  'maxmx03/solarized.nvim',
  'NTBBloodbath/sweetie.nvim',

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    }
  },

  -- 'nvim-lua/popup.nvim',
  'kyazdani42/nvim-web-devicons',
  'stevearc/oil.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Git integration
  'pwntester/octo.nvim',
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'sindrets/diffview.nvim',

  -- -- LSP
  -- Must haves
  'neovim/nvim-lspconfig',
  "folke/trouble.nvim",
  'hrsh7th/nvim-cmp', -- completion
  'filipdutescu/renamer.nvim',
  'quangnguyen30192/cmp-nvim-ultisnips',

  -- Completion sources
  'hrsh7th/cmp-nvim-lsp',
  "hrsh7th/cmp-nvim-lsp-signature-help",
  'petertriho/cmp-git',

  -- LSP tools
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- Debugging
  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  'rcarriga/nvim-dap-ui',
  'simrat39/rust-tools.nvim',

  -- Misc
  'nvim-treesitter/nvim-treesitter',
  'rktjmp/lush.nvim',       -- colorscheme aid
  'rktjmp/shipwright.nvim', -- used with Lush
  'SirVer/ultisnips',
  'shortcuts/no-neck-pain.nvim',
  'neoclide/jsonc.vim',   -- Syntax higlighting
  'tpope/vim-commentary', -- Bulk commenting
})
