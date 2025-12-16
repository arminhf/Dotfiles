local add, now, later, now_if_args = MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

-- later(function()
--   add({
--     source = "folke/lazydev.nvim",
--   })
--   require("lazydev").setup({
--     ft = "lua",
--     library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } }, },
--   })
-- end)
