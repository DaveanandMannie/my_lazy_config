return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")

      wk.add(
          {
            { "<leader>cL", ":LspRestart<CR>", desc = "Restart LSP", icon= "↺"},
          }
        )
    end,
  },
}
