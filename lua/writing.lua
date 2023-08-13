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
    lazy = false,
    version = "*",
    opts = {
      width = 100,
      background = vim.g.colors_name,

      autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
        reloadOnColorSchemeChange = true,
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

      -- local neorg_callbacks = require("neorg.core.callbacks")

      -- neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
      --   -- Map all the below keybinds only when the "norg" mode is active
      --   keybinds.map_event_to_mode("norg", {
      --       n = {
      --         { "<LocalLeader>ff", function() vim.cmd("Telescope neorg find_norg_files") end },
      --       },
      --     },
      --     {
      --       silent = true,
      --       noremap = true,
      --     }
      --   )
      -- end)
    end,
  }
}
