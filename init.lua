-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("nvim-treesitter.install").compilers = { "zig" }

-- colourscheme
vim.cmd("colorscheme wildcharm")

-- styling cuz im dumb and dont really know what im doing with this conifg
-- increase the time before whichkey pops up
vim.o.timeoutlen = 1400

-- show hidden files in neo tree
require('neo-tree').setup{
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false
        },
    }
}

--tab auto complete

local cmp = require'cmp'

cmp.setup({
    mapping = {
       ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }
})
