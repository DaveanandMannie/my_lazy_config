return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			ruby_lsp = {
				mason = false,
				cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp" },
				single_file_support = false,
				root_partern = { ".git" },
			},
		},
	},
}
