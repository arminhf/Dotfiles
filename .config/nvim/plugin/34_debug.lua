local add, now, later, now_if_args = MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

-- later(function()
--   add({
--     source = "mfussenegger/nvim-dap",
--     depends = {
--       "mfussenegger/nvim-dap-python",
--       "igorlfs/nvim-dap-view",
--     },
--   })
--   local dap = require("dap")
--   dap.setup({})
--   require("dap-python").setup("python3")
-- end)
