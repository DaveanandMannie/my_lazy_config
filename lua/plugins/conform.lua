return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- python = { "ruff" },
      python = { "black" },
      javascript = { "biome" },
    },
  },
  dependencies = {
    "mason.nvim",
  },
}
