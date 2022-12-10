local M = {}

function M.setup()
	require("bufferline").setup({
		options = {
			offsets = {
				{
					filetype = "NvimTree",
					text = "Files",
					text_align = "left",
				},
			},
			-- separator_style = "thin", -- thin "▏", thick "▌", slant, padded_slant
			-- indicator = {
			-- 	style = "underline",
			-- },
		},
	})
end

return M
