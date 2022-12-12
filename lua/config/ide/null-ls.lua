local M = {}

function M.setup()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting -- to setup formatters
	local diagnostics = null_ls.builtins.diagnostics -- to setup linters

	-- to setup format on save
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local sources = {
		-- formatting
		formatting.prettierd, -- js/ts formatter
		formatting.stylua, -- lua formatter

		diagnostics.eslint_d, -- js/ts linter

		null_ls.builtins.completion.spell,
	}

	-- list of formatters & linters for mason to install
	null_ls.setup({
		sources = sources,
		debug = false,
		debounce = 150,
		save_after_format = false,

		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = true
			
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})
end

return M
