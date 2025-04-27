return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>cL", "<cmd>LspRestart<CR>", icon = "󰝳" },
      },
      win = {
        no_overlap = false,
      },
      preset = 'modern'
    },
  },
}
