local add, now, later, now_if_args = MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

-- 'mini.completion'
later(function()
  -- orders lsp, snips, text
  local process_items_opts = {
    kind_priority = { Text = -1, Snippet = 99 },
  }
  local process_items = function(items, base)
    return MiniCompletion.default_process_items(items, base, process_items_opts)
  end

  require("mini.completion").setup({
    lsp_completion = {
      source_func = "omnifunc",
      auto_setup = false,
      process_items = process_items,
    },
  })

  local on_attach = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
  end
  _G.Config.new_autocmd("LspAttach", nil, on_attach, "Set 'omnifunc'")
  vim.lsp.config("*", { capabilities = MiniCompletion.get_lsp_capabilities() })
end)

-- 'mini.snippets'
later(function()
  add("rafamadriz/friendly-snippets")

  local snippets = require("mini.snippets")
  local config_path = vim.fn.stdpath("config")
  local latex_patterns = { "latex/**/*.json", "**/latex.json" }
  local lang_patterns = {
    tex = latex_patterns,
    plaintex = latex_patterns,
    markdown_inline = { "markdown.json" },
  }

  snippets.setup({
    snippets = {
      snippets.gen_loader.from_file(config_path .. "/snippets/global.json"),
      snippets.gen_loader.from_lang({ lang_patterns = lang_patterns }),
    },
  })

  MiniSnippets.start_lsp_server()
end)
