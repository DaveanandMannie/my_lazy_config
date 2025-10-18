return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lemminx = {
        init_options = {
          settings = {
            xml = {
              format = {
                enabled = true,
                splitAttributes = false,
              },
              validation = {
                noGrammar = "ignore",  -- This is correct
              },
            }
          }
        }
      }
    }
  }
}
