-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- colourscheme
vim.cmd("colorscheme wildcharm")

-- increase the time before whichkey pops up
vim.o.timeoutlen = 1400

--tab auto complete

local cmp = require'cmp'

cmp.setup({
    mapping = {
       ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }
})
