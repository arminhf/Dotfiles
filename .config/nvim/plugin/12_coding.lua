local add, now, later, now_if_args = MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

-- mini.ai
later(function()
  local ai = require("mini.ai")
  local gen_ai_spec = require("mini.extra").gen_ai_spec
  ai.setup({
    custom_textobjects = {
      B = gen_ai_spec.buffer(),
      F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
    },
    search_method = "cover",
  })
end)

-- mini.align
later(function()
  local align = require("mini.align")
  align.setup({})
end)

-- mini.comment
later(function()
  local comment = require("mini.comment")
  comment.setup({})
end)

-- mini.move
later(function()
  local move = require("mini.move")
  move.setup({})
end)

-- mini.operators
later(function()
  local operators = require("mini.operators")
  operators.setup({})
end)

-- mini.pairs
later(function()
  local pairs = require("mini.pairs")
  pairs.setup({})
end)

later(function()
  local surround = require("mini.surround")
  surround.setup({})
end)
