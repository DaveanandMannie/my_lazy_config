return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      DEBT = { icon = "󰢖 ", color = "debt" },
      TODO = { icon = "󱩽 " },
    },
    colors = { debt = { "DiffDelete" } },
  },
}
