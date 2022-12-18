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

  -- Search
  {
    "nvim-telescope/telescope.nvim",
    event = { "VimEnter" },
    config = function()
      require("config.telescope").setup()
    end,
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
    },
  },

  --
  -- IDE experience
  --

  -- Completion
  {
    "hrsh7th/nvim-cmp", -- Autocompletion plugin
    event = "InsertEnter",
    opt = true,
    config = function()
      require("config.ide.cmp").setup()
    end,
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
      { "hrsh7th/cmp-nvim-lsp", module = { "cmp_nvim_lsp" } }, -- LSP source for nvim-cmp
      {
        "L3MON4D3/LuaSnip", -- Snippets plugin
        wants = "friendly-snippets",
        module = { "luasnip" },
      },
      "rafamadriz/friendly-snippets",
    },
  },

  -- Install and manage LSP servers, DAP servers, linters, and formatters
  {
    "neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
    event = "BufRead",
    config = function()
      require("config.ide.lsp").setup()
    end,
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
          require("config.ide.lsp-signature").setup()
        end,
        after = "nvim-lspconfig",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("config.ide.null-ls").setup()
    end,
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap", -- DAP Client
    -- event = "BufWinEnter",
    requires = {
      "rcarriga/nvim-dap-ui", -- Debugger user interface
      "theHamsta/nvim-dap-virtual-text", -- virtual text support to nvim-dap
      -- configurations for the official vscode js debugger, which runs javascript/typescript
      -- (both in-browser and node.js)
      "mxsdev/nvim-dap-vscode-js",
    },
    config = function()
      require("config.ide.debug").setup()
    end,
  },
}

return plugins
