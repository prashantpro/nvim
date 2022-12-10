local plugins = {
	-- A library of lua functions used by others
	{ "nvim-lua/plenary.nvim", module = "plenary" },

  -- Colorscheme
  { 
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("config.colorscheme").setup()
    end, 
  },

  -- Commonly used icons
  { "nvim-tree/nvim-web-devicons" },

  -- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("config.nvim-tree").setup()
		end,
	},

  -- Buffer line
	{
		"akinsho/nvim-bufferline.lua",
		tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons",
		event = "BufReadPre",
		config = function()
			require("config.bufferline").setup()
		end,
	},
	-- delete buffer but preserve window layout
	{
		"famiu/bufdelete.nvim",
		config = function()
			require("bufdelete")
		end,
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	},
}

return plugins
