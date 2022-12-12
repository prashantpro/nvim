local M = {}

function M.init(client, bufnr)
  -- for conciseness
  local keymap = vim.keymap

  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Mappings
  keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration

  -- keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- see definition and make edits in window
  keymap.set("n", "gd", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts) -- see definition and make edits in window

  -- keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
  keymap.set("n", "gi", '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', opts) -- go to implementation

  -- keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- show definition, references
  keymap.set("n", "gr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>', opts) -- show definition, references

  -- keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  keymap.set("n", "gt", '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>', opts)

  keymap.set("n", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- show documentation for what is under cursor

  -- diagnostics
  keymap.set("n", "ge", '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<CR>', opts)
  keymap.set("n", "<leader>ge", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
  keymap.set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  keymap.set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

  -- code actions
  keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- smart rename
  keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- see available code actions

  -- workspace
  keymap.set("n", "<space>wd", "<cmd>Telescope diagnostics<CR>", opts)
  keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  keymap.set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

  if client.server_capabilities.documentFormattingProvider then
    -- formatting
    keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts) -- format buffer
    keymap.set("v", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts) -- format selected text
  end
end

return M
