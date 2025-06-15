-- nvim/lua/plugins/formatters.lua
return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				-- Options for formatters by filetype
				lua = { "stylua" },
				nix = { "alejandra" },
				java = { "google-java-format" },
				python = { "black" },
				go = { "gofumpt" },
				rust = { "rustfmt" },
				toml = { "taplo" },
				javascript = { "prettierd" },
				shell = { "shfmt" },
			},
			-- You can also add specific formatter options if needed, e.g.:
			-- formatters = {
			--   stylua = {
			--     -- args = { "--config-path", vim.fn.stdpath("config") .. "/stylua.toml" }
			--   }
			-- }
		},
	},
}
