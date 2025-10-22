return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			ruby_lsp = {
				mason = false,
				cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp" },
				init_options = {
					enabled_features = {
						codeActions = true,
						codeLens = true,
						completion = true,
						definition = true,
						diagnostics = true,
						documentHighlights = true,
						documentLink = true,
						documentSymbols = true,
						foldingRanges = true,
						formatting = true,
						hover = true,
						inlayHint = true,
						onTypeFormatting = true,
						selectionRanges = true,
						semanticHighlighting = true,
						signatureHelp = true,
						typeHierarchy = true,
						workspaceSymbol = true,
					},
				},
			},
		},
	},
}
