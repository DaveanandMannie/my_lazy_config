-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--  powershell so my shit compiles with zig when i install
vim.o.shell = "pwsh"
vim.o.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellquote = ""
vim.o.shellxquote = ""
-- colourscheme
vim.cmd("colorscheme wildcharm")
vim.api.nvim_set_hl(0, "Normal", { bg = "#18131e" })
