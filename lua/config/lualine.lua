local M = {}

function M.setup()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "gruvbox",
			globalstatus = true,
		},
	})
end

return M
