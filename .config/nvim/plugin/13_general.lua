local add, now, later, now_if_args = MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

later(function()
  require("mini.bracketed").setup({})
end)

later(function()
  require("mini.bufremove").setup({})
end)

now(function()
  local files = require("mini.files")
  files.setup({
    windows = {
      preview = true,
    },
    mappings = {
      go_in = "<CR>",
      go_in_plus = "L",
      go_out = "-",
      go_out_plus = "H",
    },
  })
end)
