# Neovim config (Text Editor to Power Editor to IDE level)

After referring to multiple docs, articles, example configs, and videos, I have finally settled on a Neovim configuration that is perfect—for my needs.
This repo serves as a reference of how one could configure and setup Neovim, for that **lightweight yet productive IDE** most of us keep searching for.

VIM way is not for everyone, but it should certainly be given a shot. If you get good at it, it's hard to go back to anything else.
But it's fairly easy to quit `:q!`—if you didn't get the joke, this one's gonna need some work.

This repo contains branches that serve as a reference to help transition our neovim experience to the next level.

Branch
- 01-editor-noplugins

  This contains various settings and keymaps which provide a better text editing experience when using Neovim.

- 02-editor-plugins-support

  This contains packer support with the below plugins configured. This gives us a colorscheme and file explorer.
  
  - ✓ Installed nvim-lua/plenary.nvim
  - ✓ Installed nvim-tree/nvim-web-devicons
  - ✓ Installed nvim-tree/nvim-tree.lua
  - ✓ Installed ellisonleao/gruvbox.nvim

- 03-editor-bufr-status

  This gives us a global status line and buffers. Buffer with tab like experience using `<C-[>` for prev bufr and `<C-]>` for the next.
  Deletion of buffer with `<C-w>` which preserves the window layout.
  
  - ✓ Installed akinsho/nvim-bufferline.lua
  - ✓ Installed famiu/bufdelete.nvim
  - ✓ Installed nvim-lualine/lualine.nvim

- 04-editor-improved-editing

  We add support for syntax highlighting with treesitter parsers. Indentation guides, Better Commenting support, Edit the surrounding, with options like `cs"'`
  
  - ✓ Installed nvim-treesitter/nvim-treesitter
  - ✓ Installed lukas-reineke/indent-blankline.nvim
  - ✓ Installed numToStr/Comment.nvim
  - ✓ Installed tpope/vim-surround

- 05-editor-powertools

  Git support using gitsigns, Search, and a terminal with a handy shortcut `<C-\>`
  
  - ✓ Installed lewis6991/gitsigns.nvim
  - ✓ Installed akinsho/toggleterm.nvim
  - ✓ Installed nvim-telescope/telescope.nvim
  - ✓ Installed nvim-lua/popup.nvim
  - ✓ Installed nvim-telescope/telescope-fzf-native.nvim

- 06-base-ide

  Completion plugins and snippets  
    - ✓ Installed hrsh7th/nvim-cmp
    - ✓ Installed hrsh7th/cmp-buffer
    - ✓ Installed hrsh7th/cmp-path
    - ✓ Installed hrsh7th/cmp-nvim-lsp
    - ✓ Installed saadparwaiz1/cmp_luasnip
    - ✓ Installed L3MON4D3/LuaSnip
    - ✓ Installed rafamadriz/friendly-snippets

  Install and manage LSP servers, DAP servers, linters, and formatters
    - ✓ Installed neovim/nvim-lspconfig
    - ✓ Installed williamboman/mason.nvim
    - ✓ Installed williamboman/mason-lspconfig.nvim
    - ✓ Installed WhoIsSethDaniel/mason-tool-installer.nvim

  Helps with function signatures
    - ✓ Installed ray-x/lsp_signature.nvim

  Injects LSP diagnostics, code actions, formatting, and more
    - ✓ Installed jose-elias-alvarez/null-ls.nvim
