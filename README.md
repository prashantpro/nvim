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