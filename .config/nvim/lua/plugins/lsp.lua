-- .config/nvim/lua/plugins/lsp.lua

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			servers = {
				astro = {},
				tailwindcss = {},
				unocss = {},
				volar = {},
				vtsls = {},
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "markdown-toc" })
		end,
	},
}