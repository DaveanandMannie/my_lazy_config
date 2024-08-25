return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      -- Configure which LSP servers to automatically install
      ensure_installed = {
                "basedpyright",
                "flake8",
                "json-lsp",
                "lua-language-server",
                "marksman",
                "ruff",
                "shfmt",
                "sylua"
            },
    })

    local lspconfig = require("lspconfig")

    -- Disable inlay hints for basedpyright
    lspconfig.basedpyright.setup({
      settings = {
        python = {
          analysis = {
            inlayHints = {
              enabled = false
            }
          }
        }
      }
    })
  end,
---  idk but this fixed it lol
{
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
  },
}
}
