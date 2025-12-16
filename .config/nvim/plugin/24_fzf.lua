local add, now, later, now_if_args = MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

later(function()
  add({
    source = "ibhagwan/fzf-lua",
  })
end)
