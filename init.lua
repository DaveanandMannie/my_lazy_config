-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local os_info = require("os_info")

--  powershell so my shit compiles with zig when i install
if os_info.is_windows then
  vim.o.shell = "pwsh"
  vim.o.shellcmdflag =
    "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

-- colourscheme
vim.cmd("colorscheme wildcharm")
vim.api.nvim_set_hl(0, "Normal", { bg = "#18131e" })
vim.api.nvim_set_hl(0, "VertSplit", {
  fg = "NONE", -- Set the foreground (border color)
  bg = "NONE", -- Make the background transparent
  ctermbg = 0, -- For terminal background color
  ctermfg = 15, -- For terminal foreground color
})
vim.api.nvim_set_hl(0, "Pmenu", {

  fg = "NONE", -- Set the foreground (border color)
  bg = "NONE", -- Make the background transparent
  ctermbg = 0, -- For terminal background color
  ctermfg = 15, -- For terminal foreground color
})

-- clipboard

if vim.fn.has("wsl") == 1 then
  -- WSL-specific clipboard configuration
  vim.cmd([[
    let g:clipboard = {
    \   'name': 'WslClipboard',
    \   'copy': {
    \      '+': 'clip.exe',
    \      '*': 'clip.exe',
    \    },
    \   'paste': {
    \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \   },
    \   'cache_enabled': 0,
    \ }
  ]])
elseif vim.fn.has("unix") == 1 then
  -- Native Linux-specific clipboard configuration
  vim.cmd([[
    let g:clipboard = {
    \   'name': 'LinuxClipboard',
    \   'copy': {
    \      '+': 'xclip -selection clipboard',
    \      '*': 'xclip -selection primary',
    \    },
    \   'paste': {
    \      '+': 'xclip -selection clipboard -o',
    \      '*': 'xclip -selection primary -o',
    \   },
    \   'cache_enabled': 0,
    \ }
  ]])
end
