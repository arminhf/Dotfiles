local add = MiniDeps.add
local now = MiniDeps.now
local later = MiniDeps.later
local now_if_args = _G.Config.now_if_args

--- Appearance

vim.cmd([[colorscheme miniwinter]])

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

now(function()
    require("mini.icons").setup({})
    later(MiniIcons.mock_nvim_web_devicons)
    later(MiniIcons.tweak_lsp_kind)
end)

now(function()
    require("mini.notify").setup({})
end)

now(function()
    require("mini.statusline").setup({})
end)

now(function()
    require("mini.tabline").setup({})
end)

--- General workflow
now(function()
    require("mini.basics").setup({
        -- Manage options manually in a spirit of transparency
        options = { basic = false },
        mappings = { windows = true, move_with_alt = true },
        autocommands = { relnum_in_visual_mode = false },
    })
end)

later(function()
    require("mini.bracketed").setup({})
end)

later(function()
    require("mini.bufremove").setup({})
end)

--[[
later(function()
    require("mini.clue").setup({})
end)
--]]

later(function()
    require("mini.cmdline").setup({})
end)

now_if_args(function()
    require("mini.files").setup({
        windows = {
            preview = false,
        },
        mappings = {
            go_in = "<CR>",
            go_in_plus = "L",
            go_out = "-",
            go_out_plus = "H",
        },
    })
end)

later(function()
    require("mini.git").setup({})
    require("mini.diff").setup({})
end)

--- Text editing
later(function()
    local ai = require("mini.ai")
    local gen_ai_spec = require("mini.extra").gen_ai_spec
    ai.setup({
        custom_textobjects = {
            B = gen_ai_spec.buffer(),
            F = ai.gen_spec.treesitter({
                a = "@function.outer",
                i = "@function.inner",
            }),
        },
        search_method = "cover",
    })
end)

later(function()
    local align = require("mini.align")
    align.setup({})
end)

later(function()
    local comment = require("mini.comment")
    comment.setup({})
end)

later(function()
    local move = require("mini.move")
    move.setup({})
end)

later(function()
    local operators = require("mini.operators")
    operators.setup({})
end)

later(function()
    local pairs = require("mini.pairs")
    pairs.setup({})
end)

later(function()
    local surround = require("mini.surround")
    surround.setup({})
end)
