local M = {}

-- OS detection logic
if vim.fn.has("win32") == 1 then
  M.is_windows = true
elseif vim.fn.has("unix") == 1 then
  M.is_linux = true
elseif vim.fn.has("mac") == 1 then -- INFO: LOL
  M.is_mac = true
else
  print("Unsupported OS detected!")
  M.config_path = nil
end
return M
