-- nvim/lua/config/keymaps.lua
-- Centralized keymaps

local function set_keymaps()
  local builtin = require("telescope.builtin")

  -- Telescope
  vim.keymap.set("n", "<leader>ff", function()
    builtin.find_files({ hidden = true })
  end, { desc = "Telescope find files" })
  vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
  vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

  -- Treesj
  vim.keymap.set("n", "J", "<cmd>TSJToggle<cr>", { desc = "Join Toggle" })

  -- Dial
  vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { desc = "Increment" })
  vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { desc = "Decrement" })
end

return {
  set = set_keymaps,
}
