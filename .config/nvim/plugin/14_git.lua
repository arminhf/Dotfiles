--
MiniDeps.later(function()
  MiniDeps.add("folke/snacks.nvim")
  require("snacks").setup({
    lazygit = {},
  })
end)

MiniDeps.later(function()
  require("mini.git").setup({})
end)

MiniDeps.later(function()
  require("mini.diff").setup({})
end)
