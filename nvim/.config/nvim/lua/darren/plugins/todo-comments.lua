return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function()
		local todo_comments = require("todo-comments")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "gcn", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		keymap.set("n", "gcp", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })
		todo_comments.setup()
	end,
}
