return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        biome = {
          -- You can add any specific options for Biome here
          init_options = {
            logLevel = "info",
          },
          setup = function()
            require'lspconfig'.biome.setup{}
          end,
        },
      },
    },
  },
}
