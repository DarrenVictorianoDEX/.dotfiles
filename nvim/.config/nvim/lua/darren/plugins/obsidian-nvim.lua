return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "SecondBrain",
				path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/SecondBrain",
			},
		},
		ui = {
			enable = false, -- disable custom UI features (like checkboxes, headings, etc.)
		},
		completion = {
			nvim_cmp = false, -- disable obsidian-specific completion
		},
		templates = {
			subdir = "Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},
		mappings = {}, -- avoid overriding keys like `gf` or `[[]]` navigation
	},
}
