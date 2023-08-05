return {
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
      width = 80,
      background = vim.g.colors_name,

      autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
        reloadOnColorSchemeChange = true,
      }
    },
    config = function()
      vim.keymap.set("n", "<leader>z", function() vim.cmd("NoNeckPain") end)
    end
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

      local start = "Telescope neorg "
      local neorg_callbacks = require("neorg.core.callbacks")
      neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode("norg", {
          n = { -- Bind keys in normal mode
            {
              "<LocalLeader>ff",
              function()
                vim.cmd(start .. "find_norg_files")
              end
            },
            -- {
            --   "<LocalLeader>fl",
            --   function()
            --     vim.cmd(start .. "find_linkable")
            --   end
            -- },
            -- {
            --   "<LocalLeader>ifl",
            --   function()
            --     vim.cmd(start .. "insert_file_link")
            --   end
            -- },
            -- {
            --   "<LocalLeader>il",
            --   function()
            --     vim.cmd(start .. "insert_link")
            --   end
            -- },
          },
        }, {
          silent = true,
          noremap = true,
        })
      end)
    end,
  }
}
