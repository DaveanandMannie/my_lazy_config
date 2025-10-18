return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			python = { "black" },
			javascript = { "biome" },
			go = { "goimports", "gofumpt" },
			xml = { "lemminx" },
		},
	},
	dependencies = {
		"mason.nvim",
	},
}
