-- nvim/lua/config/keymaps.lua

-- Telescope
local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files({ hidden = true })
end, { desc = "Telescope find files" })

vim.keymap.set("n", "<leader>fw", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
