local add, now, later, now_if_args = MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

now_if_args(function()
  add({
    source = "neovim/nvim-lspconfig",
    depends = { "mason-org/mason.nvim" },
  })

  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  -- HACK: https://www.reddit.com/r/neovim/comments/1p1y73n/automatically_downloading_and_installing_lsps/
  local servers = {
    -- Must be Mason package names
    "tree-sitter-cli", -- Forgot why I added this
    "basedpyright",
    "bash-language-server",
    "css-lsp",
    "debugpy",
    "eslint_d",
    "html-lsp",
    "htmlhint",
    "hyprls",
    "js-debug-adapter",
    "julia-lsp",
    "jupytext",
    "lua-language-server",
    "prettier",
    "prettierd",
    "ruff",
    "selene",
    "shellcheck",
    "shfmt",
    "stylelint",
    "stylua",
    "tailwindcss-language-server",
    "typescript-language-server",
  }

  local installed = require("mason-registry").get_installed_package_names()
  for _, server in ipairs(servers) do
    if not vim.tbl_contains(installed, server) then
      vim.cmd(":MasonInstall " .. server)
    end
  end

  local packages = require("mason-registry").get_installed_packages()
  local lsp_configs = vim.iter(packages):fold({}, function(acc, pkg)
    table.insert(acc, pkg.spec.neovim and pkg.spec.neovim.lspconfig)
    return acc
  end)

  vim.lsp.enable(lsp_configs)
end)
