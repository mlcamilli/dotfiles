local telescope = require("telescope")

telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "^.git",
            "node_modules",
            "__pycache__",
            "coverage",
            ".mypy_cache"
        },
    },
    pickers = {
        find_files = {
            hidden=true,
            theme = "dropdown",
        },

        live_grep = {
          mappings = {
              i = { ["<c-f>"] = require('telescope.actions').to_fuzzy_refine },
          },
      },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')
