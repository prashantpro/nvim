local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  require("config.ide.mappings").init(client, bufnr)

  -- Show line diagnostics automatically in hover window
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local diag_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, diag_opts)
    end,
  })
end

-- disable inline errors as we show them on hover
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
})

-- Add capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

function M.setup()
  local lspconfig = require("lspconfig")

  -- enable mason
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  require("mason-tool-installer").setup({
    ensure_installed = { "stylua", "shfmt", "prettierd", "shellcheck", "eslint_d", "js-debug-adapter" },
    auto_update = false,
    run_on_start = true,
    start_delay = 3000, -- 3 second delay
  })

  require("mason-lspconfig").setup({
    -- list of servers for mason to install
    ensure_installed = {
      "html",
      "tsserver",
      "cssls",
      "jsonls",
      "sumneko_lua",
      "tailwindcss"
    },
    automatic_installation = false,
  })
  -- https://github.com/Pocco81/.dots/blob/main/dots/.config/nvim/lua/configs/lsp/init.lua
  --- Set up completion using nvim_cmp with LSP source

  require("mason-lspconfig").setup_handlers({
    -- default handler that will be called for each installed server
    -- Enable language servers with the additional completion capabilities offered by nvim-cmp
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = M.capabilities,
        on_attach = M.on_attach,
      })
      -- You can also override the default handler for specific servers by providing them as keys, like so:
      -- ["rust_analyzer"] = function ()
      --   require("rust-tools").setup {}
      -- end
      lspconfig["sumneko_lua"].setup({
        capabilities = M.capabilities,
        on_attach = M.on_attach,

        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
            telemetry = { enable = false },
          },
        },
      })
    end,
  })

  --
  -- Diagnostics
  --
  -- Change the Diagnostic symbols in the sign column (gutter)
  local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

return M
