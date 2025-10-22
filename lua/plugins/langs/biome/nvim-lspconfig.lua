return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			biome = {
				cmd = { "biome", "lsp-proxy" },
				filetypes = { "javascript", "css", "json" },
			},
		},
	},
}
