-- Bootstrap 'mini.nvim'
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
    vim.cmd(
        'echo "Installing [`mini.nvim`](../doc/mini-nvim.qmd#mini.nvim)" | redraw'
    )
    local clone_cmd = {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/nvim-mini/mini.nvim",
        mini_path,
    }
    vim.fn.system(clone_cmd)
    vim.cmd("packadd mini.nvim | helptags ALL")
    vim.cmd(
        'echo "Installed [`mini.nvim`](../doc/mini-nvim.qmd#mini.nvim)" | redraw'
    )
end

-- Plugin manager
require("mini.deps").setup({})

-- Define main config table to pass data between scripts
_G.Config = {}

-- Define setting up plugins when needed
_G.Config.now_if_args = vim.fn.argc(-1) > 0 and MiniDeps.now or MiniDeps.later

-- Define custom autocommand group
local gr = vim.api.nvim_create_augroup("custom-config", {})
_G.Config.new_autocmd = function(event, pattern, callback, desc)
    local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
    vim.api.nvim_create_autocmd(event, opts)
end
