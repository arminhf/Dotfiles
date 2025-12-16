local add, now, later, now_if_args = MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

later(function()
  vim.diagnostic.config({
    -- Show signs on top of any other sign, but only for warnings and errors
    signs = { priority = 9999, severity = { min = "WARN", max = "ERROR" } },
    -- Show all diagnostics as underline (for their messages type `<Leader>ld`)
    underline = { severity = { min = "HINT", max = "ERROR" } },
    -- Show more details immediately for errors on the current line
    virtual_lines = false,
    virtual_text = {
      current_line = true,
      severity = { min = "ERROR", max = "ERROR" },
    },
    -- Don't update diagnostics when typing
    update_in_insert = false,
  })
end)

later(function()
  add("mfussenegger/nvim-lint")
  local lint = require("lint")

  lint.linters_by_ft = {
    css = { "stylelint" },
    html = { "htmlhint" },
    javascript = { "eslint_d" },
    lua = { "selene" },
    python = { "ruff" },
    typescript = { "eslint_d" },
  }

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      lint.try_lint()
    end,
  })
end)
