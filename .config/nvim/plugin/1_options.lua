-- :h lua-guide-variables
-- :h vim.g
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.deprecation_warnings = false
vim.g.netrw_banner = 0

-- :h vim.o,
vim.o.mouse = "a"
vim.o.mousescroll = "ver:15,hor:3"
vim.o.switchbuf = "usetab"
vim.o.undofile = true
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h"

-- UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false -- Toggle with \w
vim.o.cursorline = true
vim.o.cursorlineopt = "screenline,number"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.winborder = "single"
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

-- Folds (:h zM, zR, zA, zj)
vim.o.foldlevel = 10 -- 'foldlevel'
vim.o.foldmethod = "indent" -- 'foldmethod'
vim.o.foldnestmax = 10 -- 'foldnestmax'
vim.o.foldtext = "" -- 'foldtext'

vim.o.autoindent = true
vim.o.formatoptions = "rqnl1j"
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.infercase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.spelloptions = "camel"
vim.o.virtualedit = "block"

-- <Tab>
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 8

vim.o.showmode = false -- Status Line

vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.o.signcolumn = "yes"

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.list = true
vim.opt.lcs = { tab = "» ", trail = "·", nbsp = "␣" } -- 'listchars'

vim.o.grepprg = "rg --vimgrep"

vim.o.complete = ".,w,b,kspell"
vim.o.completeopt = "menuone,noselect,noinsert,fuzzy"
