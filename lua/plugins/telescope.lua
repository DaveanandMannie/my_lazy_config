return {
    "nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "zig build-lib -dynamic -O ReleaseSafe -target x86_64-windows-gnu src/fzf.c -lc -femit-bin=./build/libfzf.dll",
		},
		"nvim-tree/nvim-web-devicons",
	},

    keys = {
    -- add a keymap to browse plugin files
    -- stylua: ignore
    {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
    },
    },
    opts = {
    defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "descending",
        winblend = 0,
    },
    },

    config = function()
        -- Telescope setup
        require("telescope").setup {
            -- Telescope configuration
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "bottom" },
                sorting_strategy = "descending",
                winblend = 0,
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                },
            },
        }
        -- Load the fzf extension
        require("telescope").load_extension("fzf")
    end,
}
