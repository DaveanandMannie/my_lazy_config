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
              configuration = os.getenv("LOCALAPPDATA") .. "/nvim/ruff.toml",
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
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local servers = { "basedpyright", "ruff" }
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
        opts.servers[server].enabled = server == "basedpyright" or server == "ruff"
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Example settings for the adapter
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      {
        "<leader>dPt",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Method",
        ft = "python",
      },
      {
        "<leader>dPc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Class",
        ft = "python",
      },
    },
    config = function()
      if vim.fn.has("win32") == 1 then
        require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/Scripts/pythonw.exe"))
      else
        require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/bin/python"))
      end
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    cmd = "VenvSelect",
    enabled = function()
      return LazyVim.has("telescope.nvim")
    end,
    opts = {
      settings = {
        search = {
          -- windows escaping sucks 
          cwd = { command = "$FD Scripts//python.exe$ $CWD --full-path --color never -HI -a -L" },
        },
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    ft = "python",
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "python")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = {
      handlers = {
        python = function() end, -- Avoid messing up DAP adapters provided by nvim-dap-python
      },
    },
  },
}
