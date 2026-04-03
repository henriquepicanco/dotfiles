-- Lua
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", },
      diagnostics = { globals = { "vim", "require" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
})

-- Emmet
vim.lsp.config("emmet_ls", {
  filetypes = {
    "html", "typescriptreact", "javascriptreact",
    "css", "sass", "scss", "less", "astro", "blade"
  }
})

-- HTML
vim.lsp.config("html", {
  filetypes = { "html", "blade", "php" },
  init_options = { provideFormatter = true },
})

-- Astro
vim.lsp.config("astro", {})

-- CSS
vim.lsp.config("cssls", {
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    -- method/variable definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    -- check lsp
    vim.keymap.set("n", "<leader>li", function()
      vim.print(vim.lsp.get_clients({ bufnr = 0 }))
    end, { desc = "LSP: Show active clients in buffer" })
  end,
})

-- ===========
-- Diagnostics
-- ===========

vim.diagnostic.config({
  virtual_text = {
    prefix = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return ""
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return ""
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return ""
      else
        return ""
      end
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    }
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local lsp_format_group = vim.api.nvim_create_augroup("LspAutoFormat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = lsp_format_group,
  callback = function(event)
    local client = vim.lsp.get_clients({ bufnr = event.buf })[1]
    if client and client:supports_method("textDocument/formatting") then
      vim.lsp.buf.format({ async = false })
    end
  end,
})

---- ===========================
---- Native autocomplete trigger
---- ===========================
--vim.api.nvim_create_autocmd("LspAttach", {
--  callback = function(ev)
--    local client = vim.lsp.get_client_by_id(ev.data.client_id)
--    if client ~= nil and client:supports_method("textDocument/completion") then
--      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--    end
--  end,
--})

-- ===========================
-- Best autoformatting at save
-- ===========================

vim.api.nvim_create_autocmd("BufWritePre", {
  group = lsp_format_group,
  callback = function(event)
    vim.lsp.buf.format({
      bufnr = event.buf,
      filter = function(client)
        return client.name ~= "ts_ls"
      end
    })
  end,
})
