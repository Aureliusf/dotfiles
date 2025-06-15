return {
	"folke/which-key.nvim",
	opts = {
		spec = {
			{ "<BS>", desc = "Decrement Selection", mode = "x" },
			{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
		},
		ensure_installed = {
			"bash",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"java",
			"go",
			"query",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"yaml",
		},
	},
}
