return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				-- Enable hidden files globally
				-- find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		keymap.set("n", "<leader>fp", builtin.builtin, { desc = "[F]ind Builtin [P]ickers" })
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "[F]ind [S]tring Current Buffer" })
		keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
		keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
		keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[F]ind [T]odo Comments" })
		keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
		keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- Shortcut for searching your Neovim configuration files
		keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[F]ind [N]eovim files" })

		-- Keybinding to find files, including hidden ones
		-- keymap.set('n', '<leader>ff', function()
		-- builtin.find_files({ hidden = true, no_ignore = false })
		-- end, { desc = '[F]ind [F]iles (including hidden)' })
	end,
}
