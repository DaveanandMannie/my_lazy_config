return {
	"stevearc/conform.nvim",
	opts = {
		lsp_formatting = false,
		fallback = false,
		formatters_by_ft = {
			python = { "black" },
			go = { "goimports", "gofumpt" },
			xml = { "lemminx" },
			ruby = { "rubocop" },
			json = { "biome" },
			css = { "biome" },
			javascript = { "biome" },
		},
	},
	dependencies = {
		"mason.nvim",
	},
}
