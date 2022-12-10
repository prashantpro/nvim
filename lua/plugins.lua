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
}

return plugins