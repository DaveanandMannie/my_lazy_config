-- INFO: for local ruff config
local os_info = require("os_info")
local config_path

-- Determine the config path based on the OS
if os_info.is_linux then
  config_path = os.getenv("HOME") .. "/.config/nvim/ruff.toml"
elseif os_info.is_windows then
  config_path = os.getenv("LOCALAPPDATA") .. "\\nvim\\ruff.toml"
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
              configuration = config_path,  -- Use the dynamically set config_path
              configurationPreference = "filesystemFirst",
            },
          },
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
        basedpyright = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
            },
          },
        },
      },
      setup = {
        basedpyright = function()
          LazyVim.lsp.on_attach(function(client, _)
            client.server_capabilities.hoverProvider = true
          end, "basedpyright")
        end,
      },
    },
  },
}
