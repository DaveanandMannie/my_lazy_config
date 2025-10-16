return {
  "linux-cultist/venv-selector.nvim",
  lazy = false,
  keys = {
    { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" },
  },
  opts = {
    settings = {
      options = { notify_user_on_venv_activation = true },
    },
  },
}
