local M = {}

function M.setup()
	local toggleterm = require("toggleterm")

	toggleterm.setup({
		size = function(term)
			if term.direction == "horizontal" then
				return 12
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		hide_numbers = true,
		open_mapping = [[<C-\>]],
		shade_filetypes = {},
		shade_terminals = false,
		shading_factor = 0.3,
		start_in_insert = true,
		persist_size = true,
		direction = "horizontal",
		winbar = {
			enabled = false,
			name_formatter = function(term)
				return term.name
			end,
		},
	})
end

return M
