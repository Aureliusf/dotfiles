-- .config/nvim/lua/config/telescope.lua
local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_actions = require("telescope.actions")
local M = {}

telescope.setup({
	defaults = {
		prompt_position = "bottom",
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		use_less = false,
	},
})

M.find_files = function()
	telescope_builtin.find_files({
		find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
		previewer = false,
	})
end

return M
