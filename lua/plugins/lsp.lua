return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local lspconfig = require('lspconfig')
      lspconfig.basedpyright.setup {
        settings = {
          python = {
            analysis = {
              inlayHints = {
                variableTypes = false,
                functionReturnTypes = false,
              },
            },
          },
        },
        on_attach = function(client, bufnr)
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.buf.inlay_hint(bufnr, false)
          end
        end,
      }
    end,
  },
}
