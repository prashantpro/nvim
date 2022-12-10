local M = {}

function M.setup()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		-- A list of parser names
		ensure_installed = {
			"html",
			"css",
			"javascript",
			"json",
			"lua",
			"java",
			"python",			
			"tsx",
			"vim",
			-- 	"yaml",
			-- 	"rust",
				
		},
		auto_install = false,
		highlight = {
			enable = true, -- `false` will disable the whole extension
			-- list of language that will be disabled
			-- disable = { "c", "rust" },
			-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
			disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
							return true
					end
			end,
		},
		-- indent = {
		-- 	enable = true,
		-- 	disable = { "yaml" },
		-- },
		-- },
	})
end

return M
