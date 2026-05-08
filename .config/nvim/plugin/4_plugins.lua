local add = MiniDeps.add
local now = MiniDeps.now
local later = MiniDeps.later
local now_if_args = _G.Config.now_if_args

--- Tresitter
--[[
now_if_args(function()
    add({
        source = "nvim-treesitter/nvim-tresitter",
        checkout = "main",
        hooks = {
            post_checkout = function()
                vim.cmd("TSUpdate")
            end,
        },
    })

    add({
        source = "nvim-treesitter/nvim-treesitter-textobjects",
        checkout = "main",
    })

    --stylua: ignore
    local ensure_languages = {
        "bash", "c", "cpp", "css", "html", "java", "javascript", "json", "julia", "lua", "php", "python", "rust",
        "tsx", "typescript", "scss", "toml", "yaml", "markdown", "markdown_inline", "vim", "vimdoc", "hyprlang",
        "kconfig", "kitty", "zsh",
    }

    local isnt_installed = function(lang)
        return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
    end
    local to_install = vim.tbl_filter(isnt_installed, ensure_languages)

    if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
    end

    -- Enable tree-sitter after opening a file for a target language
    local filetypes = {}

    for _, lang in ipairs(ensure_languages) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
            table.insert(filetypes, ft)
        end
    end

    local ts_start = function(ev)
        vim.treesitter.start(ev.buf)
    end
    _G.Config.new_autocmd("FileType", filetypes, ts_start, "Start tree-sitter")
end)
--]]

--- LSP

--- Debugger

--- Formatter

--- Snippets
later(function()
    add("rafamadriz/friendly-snippets")
end)

--- Snacks
later(function()
    add("folke/snacks.nvim")
    require("snacks").setup({
        lazygit = {},
    })
end)
