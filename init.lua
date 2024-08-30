-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--  powershell so my shit compiles with zig when i install
vim.o.shell = "powershell"
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellquote = ""
vim.o.shellxquote = ""
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
