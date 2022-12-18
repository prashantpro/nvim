local M = {}

local opts = { noremap = true, silent = true }

function M.setup()
	local function setup_dap_virtualtext()
		local status_ok, dap_virtualtext = pcall(require, "nvim-dap-virtual-text")
		if not status_ok then
			return
		end

		dap_virtualtext.setup()
	end

	local function configure_debuggers()
		require("config.ide.debug.javascript").init()
	end

	local status_ok, dap = pcall(require, "dap")
	if not status_ok then
		return
	end

	-- Breakpoint icon
	vim.fn.sign_define("DapBreakpoint", { text = "⬤", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
	vim.fn.sign_define(
		"DapStopped",
		{ text = "⏭", texthl = "DiagnosticWarn", linehl = "DapStopped", numhl = "DapStopped" }
	)

	-- debug keybindings
	vim.api.nvim_set_keymap("n", "<F5>", '<CMD>lua require"dap".continue()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<S-F5>", '<CMD>lua require"dap".terminate()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<F7>", '<CMD>lua require"dap".step_into()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<F8>", '<CMD>lua require"dap".step_over()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<S-F8>", '<CMD>lua require"dap".step_out()<CR>', opts)
	vim.api.nvim_set_keymap("n", "<leader>db", '<CMD>lua require"dap".toggle_breakpoint()<CR>', opts)
	vim.api.nvim_set_keymap(
		"n",
		"<Leader>dB",
		'<CMD>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
		opts
	)

	-- DAP UI
	local status_dapui_ok, dap_ui = pcall(require, "dapui")
	if not status_dapui_ok then
		return
	end

	dap_ui.setup()
	vim.api.nvim_set_keymap("n", "<Leader>dr", '<CMD>lua require"dapui".toggle()<CR>', opts)

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dap_ui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dap_ui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dap_ui.close()
	end

	setup_dap_virtualtext()
	configure_debuggers()
end

return M
