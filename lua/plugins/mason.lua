return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- python
      "basedpyright",
      "ruff",
      -- js, json, xml, all front end stuff
      "black",
      -- "biome",
      "lemminx",
      -- lua
      "stylua",
      "lua-language-server",
      --ruby
      "ruby-lsp",
      -- bash
      "shfmt",
      -- go
      "goimports",
      "gofumpt"
    },
  },
}
