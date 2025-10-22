return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- python
      "basedpyright",
      "ruff",
      "black",
      -- js, json, xml, all front end stuff
      "vtsls",
      "biome",
      "lemminx",
      "html-lsp",
      -- "css-lsp",
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
