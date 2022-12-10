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

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		module = "nvim-treesitter",
		event = "VimEnter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("config.treesitter").setup()
		end,
		-- requires = {
		--   { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
		--   { "RRethy/nvim-treesitter-textsubjects", event = "BufReadPre" }
		-- }
	},

	-- Indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("indent_blankline").setup()
		end,
	},

	-- Better Comment
	{
		"numToStr/Comment.nvim",
		keys = { "gc", "gcc", "gbc" },
		config = function()
			require("config.comment").setup()
		end,
	},

	-- Better surround => add, delete, change surroundings
	{ "tpope/vim-surround", event = "BufReadPre" },

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		tag = "release",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("config.gitsigns").setup()
		end,
		event = "BufReadPre",
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		keys = { [[<C-\>]] },
		cmd = { "ToggleTerm", "TermExec" },
		module = { "toggleterm", "toggleterm.terminal" },
		config = function()
			require("config.toggleterm").setup()
		end,
	},
}

return plugins
