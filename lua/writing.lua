return {
  {
    "Exafunction/codeium.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<A-i>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<A-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<A-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<A-c>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },
  {
    "shellRaining/hlchunk.nvim",
    event = "UIEnter",
    config = function()
      require("hlchunk").setup({
        chunk = {
          use_treesitter = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "┌",
            left_bottom = "└",
            right_arrow = "─",
          },
          style = {
            vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
          },
        },

        blank = {
          enable = false,
        },

        indent = {
          enable = false,
        }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "rust" },
        highlight = {
          enable = true,
        },
      }
    end,
  },
  "tpope/vim-commentary",
  {
    "shortcuts/no-neck-pain.nvim",
    lazy = true,
    version = "*",
    opts = {
      width = 100,
      background = vim.g.colors_name,

      autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
        reloadOnColorSchemeChange = true,
      },

      buffers = {
        right = {
          enabled = false,
        },
      },

      mappings = {
        enabled = true,
        toggle = "<leader>z"
      }
    },
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neorg/neorg-telescope"
    },
    keys = {
      {
        "<LocalLeader>li",
        function() vim.cmd("Neorg workspace notes") end,
        { silent = true }
      },
      { "<LocalLeader>nr",
        function() vim.cmd("Neorg return") end,
        { silent = true }
      }
    },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
              folds = false,
            }
          },                  -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Documents/neorg",
              },
            },
          },
        },
      }
    end,
  }
}
