local os_info = require("os_info")
if not os_info.is_linux then
  require("nvim-treesitter.install").compilers = { "zig" }
end

require("nvim-treesitter.install").prefer_git = false
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function() end,
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
        --
        "toml",
        "json",
        "html",
      },
    },
  },
}
