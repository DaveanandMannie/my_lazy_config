return {
	"stevearc/conform.nvim",
	opts = {
		-- lsp_formatting = false,
		-- fallback = false,
		formatters_by_ft = {
			python = { "black" },
			go = { "goimports", "gofumpt" },
			xml = { "lemminx" },
			ruby = { "standardrb" },
			json = { "biome" , "json-lsp"},
			css = { "biome" },
			javascript = { "biome" },
			sql = { "pg_format" },
      yaml = {"hydra_lsp"}
		},
	},
	dependencies = {
		"mason.nvim",
	},
}
