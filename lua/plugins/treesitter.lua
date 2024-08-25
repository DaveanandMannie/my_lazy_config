return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require('nvim-treesitter.install').compilers = {"zig"}
    end,
    opts = {
            highlight = {enable = true},
            indent = {enable = true}
        }
    }
}
