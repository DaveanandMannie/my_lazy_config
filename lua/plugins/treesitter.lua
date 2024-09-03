require("nvim-treesitter.install").compilers = { "zig" }
require("nvim-treesitter.install").prefer_git = false
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
    end,
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        -- from extras -> python
        "python",
        "ninja",
        "rst",
        "lua",
        -- from extras -> go
        "go",
        "gomod",
        "gowork",
        "gosum",
        "toml",
        "json",
        "html",
      },
    },
  },
}
