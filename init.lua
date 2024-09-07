-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--  powershell so my shit compiles with zig when i install
vim.o.shell = "C:/Program Files/PowerShell/7/pwsh.exe"
vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellquote = ""
vim.o.shellxquote = ""
-- colourscheme
vim.cmd("colorscheme wildcharm")
