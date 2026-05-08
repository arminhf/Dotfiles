local add, now, later, now_if_args =
    MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

now_if_args(function()
    local languages = {
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "java",
        "javascript",
        "json",
        "julia",
        "lua",
        "php",
        "python",
        "rust",
        "tsx",
        "typescript",
        "scss",
        "toml",
        "yaml",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
        "hyprlang",
        "kconfig",
        "kitty",
        "zsh",
    }

    add({
        source = "nvim-treesitter/nvim-treesitter",
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

    local isnt_installed = function(lang)
        return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
    end

    local to_install = vim.tbl_filter(isnt_installed, languages)

    if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
    end

    -- Enable tree-sitter after opening a file for a target language
    local filetypes = {}

    for _, lang in ipairs(languages) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
            table.insert(filetypes, ft)
        end
    end

    local ts_start = function(ev)
        vim.treesitter.start(ev.buf)
    end
    _G.Config.new_autocmd("FileType", filetypes, ts_start, "Start tree-sitter")
end)
