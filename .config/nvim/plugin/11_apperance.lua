local add, now, later, now_if_args = MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

-- colorscheme
now(function()
  add({
    source = "rose-pine/neovim",
    name = "rose-pine",
  })
  require("rose-pine").setup({
    styles = {
      bold = true,
      italic = false,
      transparency = false,
    },
  })
  vim.cmd("colorscheme default")
end)

-- mini.cursorword not a fan tbh
-- now_if_args(function()
--   local cursorword = require("mini.cursorword")
--   cursorword.setup()
-- end)

-- mini.hipatterns
-- TODO add tailwindcss colors and others?
now_if_args(function()
  local hipatterns = require("mini.hipatterns")
  hipatterns.setup({
    highlighters = {
      hex_color = hipatterns.gen_highlighter.hex_color(),
      fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
      hack = { pattern = "HACK", group = "MiniHipatternsHack" },
      todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
      note = { pattern = "NOTE", group = "MiniHipatternsNote" },
    },
  })
end)

-- mini.icons
now(function()
  require("mini.icons").setup()
  -- For plugins without "mini.icons" support
  later(MiniIcons.mock_nvim_web_devicons)
  -- Useful for "mini.completion" LSP
  later(MiniIcons.tweak_lsp_kind)
end)

-- mini.notify
now(function()
  require("mini.notify").setup()
end)

-- mini.statusline
now(function()
  require("mini.statusline").setup()
end)

-- mini.tabline
now(function()
  require("mini.tabline").setup()
end)
