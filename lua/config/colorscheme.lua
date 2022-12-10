local M = {}

function M.setup()
	local status_ok, gruvbox = pcall(require, "gruvbox")
	if not status_ok then
		return
	end

	gruvbox.setup()
	-- setup must be called before loading
	vim.api.nvim_command("colorscheme gruvbox")

end

return M