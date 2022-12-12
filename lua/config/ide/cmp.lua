local M = {}

function M.setup()
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local luasnip = require("luasnip")
  local cmp = require("cmp")
  luasnip.setup({ region_check_events = "InsertEnter", delete_check_events = "InsertEnter" })
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0,
      },
    },
    formatting = {
      format = require("config.ide.kind").cmp_format(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
      ["<C-e>"] = cmp.mapping.abort(), -- close completion window
      ["<CR>"] = cmp.mapping.confirm({ -- this replaces method/text during autocompletion
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),

      -- use Tab and shift-Tab to navigate autocomplete menu
      ["<Tab>"] = cmp.mapping(function(fallback) -- use tab for next suggestion
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback) -- use shift-tab for prev suggestion
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
      { name = "nvim_lsp" }, -- lsp
      { name = "luasnip" }, -- snippets
      { name = "buffer" }, -- text within current buffer
      { name = "path" }, -- file system paths
    }),
  })
end

return M
