local M = {}

function M.setup()
	-- Indicate first time installation
	local packer_bootstrap = false

	-- packer.nvim configuration
	local conf = {
		profile = {
			enable = true,
			threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	}

	-- Check if packer.nvim is installed
	-- Run PackerCompile if there are changes in this file
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system({
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			})
			vim.cmd([[packadd packer.nvim]])
		end

		-- autocommand that reloads neovim and installs/updates/removes plugins
		-- when file is saved
		vim.cmd([[ 
			augroup packer_user_config
				autocmd!
				autocmd BufWritePost plugins.lua source <afile> | PackerSync
			augroup end
		]])
	end

	-- Plugins
	local function plugins(use)
		-- packer can manage itself
		use({ "wbthomason/packer.nvim" })

		local user_plugins = require("plugins")

		for _, plugin in ipairs(user_plugins) do
			use(plugin)
		end

		if packer_bootstrap then
			require("packer").sync()
		end
	end

	-- Init and start packer
	packer_init()

	local packer = require("packer")

	packer.init(conf)
	packer.startup(plugins)
end

return M
