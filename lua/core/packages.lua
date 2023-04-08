-- Packer
Cmd([[autocmd BufWritePost install.lua PackerCompile]])
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/home/yjh/.config/nvim/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

Cmd([[command! Install :w | so % | PackerInstall]])
Cmd([[command! Sync :w | so % | :PackerSync]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'https://github.com/shaunsingh/nord.nvim'
  use 'https://github.com/Mofiqul/vscode.nvim'

  -- Editing
  use 'https://github.com/mbbill/undotree'
  use 'https://github.com/tpope/vim-commentary'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  -- Git integration
  use 'lewis6991/gitsigns.nvim'
  use 'https://github.com/tpope/vim-fugitive'
  use 'https://github.com/pwntester/octo.nvim'

  --- Git autocompletion with lsp
  use 'https://github.com/petertriho/cmp-git/'

  -- Aesthetics
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local opts = require("plugins.dashboard")
      require("dashboard").setup {
        theme = 'doom',
        hide = { statusline = false },
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
    end
  }


  -- File browsing
  --- Nvim tree
  use 'https://github.com/nvim-tree/nvim-tree.lua'

  --- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'kyazdani42/nvim-web-devicons'

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- IDE features
  --- LSP config
  use 'neovim/nvim-lspconfig'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }

  --- LSP tools
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }
  use {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'https://github.com/simrat39/rust-tools.nvim'


  --- Debugging
  use 'https://github.com/AlphabetsAlphabets/gdb.nvim'
  use 'https://github.com/mfussenegger/nvim-dap'
  use 'https://github.com/theHamsta/nvim-dap-virtual-text'
  use 'https://github.com/rcarriga/nvim-dap-ui'

  -- Latex
  use 'https://github.com/lervag/vimtex'

  -- Misc
  --- Note taking with neorg
  use {
    "nvim-neorg/neorg",
    requires = {
      "nvim-lua/plenary.nvim",
    }
  }

  --- Neorg extension
  use 'https://github.com/nvim-neorg/neorg-telescope'

  --- json syntax highlighting
  use 'https://github.com/neoclide/jsonc.vim'

  --- Centers current buffer
  use { "shortcuts/no-neck-pain.nvim", tag = "*" }
end)
