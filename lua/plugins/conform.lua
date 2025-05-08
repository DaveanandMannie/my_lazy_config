return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- python = { "ruff" },
      python = { "black" },
      javascript = { "biome" },
      go =  {'goimports', 'gofumpt'}
    },
  },
  dependencies = {
    "mason.nvim",
  },
}
