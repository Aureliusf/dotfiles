-- nvim/init.lua

require("options") -- vim native options
require("config.lazy") -- lazy.nvim plugin manager

-- Telescope
require("plugins.telescope")
require("config.telescope")
