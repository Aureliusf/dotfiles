return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				prompt_position = "bottom",
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				use_less = false,
			},
		})
	end,
}