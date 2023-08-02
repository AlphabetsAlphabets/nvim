return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
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
    dependencies = { "nvim-lua/plenary.nvim" },
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
