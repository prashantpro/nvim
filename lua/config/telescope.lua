local M = {}

function M.setup()
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup({		
		defaults = {		
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<Esc>"] = actions.close, -- use Esc even in insert mode to exit
				},
			},
		},
    pickers = {
      find_files = {
        prompt_prefix = " ",
        selection_caret = " ",
        theme = "dropdown",
        previewer = false
      },
      buffers = {
        prompt_prefix = " ",
        selection_caret = " ",
        theme = "dropdown",
        sort_lastused = true,
        previewer = false
      },
    },
  })

  telescope.load_extension("fzf")
end

return M