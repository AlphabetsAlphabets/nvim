local telescope = {
  keys = {
    { "<leader>jl",  ":Telescope jumplist<cr>" },
    { "<leader>fd",  ":Telescope current_buffer_fuzzy_find<cr>" },
    { "<leader>ht",  ":Telescope help_tags<cr>" },
    { "<leader>rg",  ":Telescope live_grep<cr>" },
    { "<leader>fb",  ":Telescope buffers<cr>" },
    { "<leader>gb",  ":Telescope git_branches<cr>" },
    { "<leader>glb", ":Telescope git_stash<cr>" },
    { "<leader>ff", function()
      local builtin = require("telescope.builtin")
      local args = {
        find_command = {
          'rg', '--files', '--hidden',
          '--glob', '!**/.ccls-cache/*',
          '--glob', '!**/.git/*'
        }
      }
      builtin.find_files(args)
    end
    }
  },
  config = function(actions)
    local opts = {
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.725,
        width = 0.55,
      },

      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob",
            "!**/.git/*"
          }
        }
      },

      set_env = { ["COLORTERM"] = "truecolor" },

      color_devicons = true,

      mappings = {
        i = {
          ["<CR>"] = actions.select_default + actions.center,
          ["<C-o>"] = actions.select_tab,
          ["<C-c>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },

      extensions = {
        coc = {
          theme = 'ivy',
          prefer_locations = true,
        },
      }
    }

    local os = vim.loop.os_uname().sysname
    if os == "Linux" then
      require("telescope").load_extension("fzf")
      opts.extensions["fzf"] = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      }
    end

    require("telescope").load_extension("neorg")

    require('telescope').setup {
      defaults = opts
    }
  end
}

return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    dependencies = {
      {
        'nvim-telescope/telescope.nvim',
        keys = telescope.keys,
      },
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local actions = require("telescope.actions")
      telescope.config(actions)
    end
  },
  {
    'stevearc/oil.nvim',
    keys = {
      { "<A-o>", "<cmd>Oil .<CR>" }
    },
    config = function()
      require("oil").setup()
    end
  }
}
