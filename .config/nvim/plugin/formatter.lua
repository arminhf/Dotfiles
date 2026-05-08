local add, now, later, now_if_args =
    MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

later(function()
    add("stevearc/conform.nvim")
    local conform = require("conform")

    conform.setup({
        formatters_by_ft = {
            css = { "prettierd" },
            html = { "prettierd" },
            javascript = { "prettierd" },
            json = { "prettierd" },
            lua = { "stylua" },
            python = { "ruff" },
        },

        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },

        log_level = vim.log.levels.DEBUG,
        notify_on_error = true,
        notify_no_formatters = true,
    })
end)
