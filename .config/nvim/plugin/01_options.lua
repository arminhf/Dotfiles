-- :h lua-guide-variables
-- Globals :h vim.g
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.deprecation_warnings = false
vim.g.netrw_banner = 0

-- options :h vim.o,
vim.o.mouse = "a"
vim.o.mousescroll = "ver:25,hor:6"
vim.o.swb = "usetab" -- 'switchbuf'
vim.o.udf = true -- 'undofile'
vim.o.sd = "'100,<50,s10,:1000,/100,@100,h" -- Limit 'shada' file

-- UI
vim.o.nu = true -- 'number'
vim.o.rnu = true -- 'relativenumber'

vim.o.wrap = false -- Toggle with \w

vim.o.cul = true -- 'cursorline'
vim.o.culopt = "screenline,number" -- 'cursorlineopt'
vim.o.spr = true -- 'splitright'
vim.o.sb = true -- 'splitbelow'
vim.o.winborder = "single"
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

-- Folds (:h zM, zR, zA, zj)
vim.o.fdl = 10 -- 'foldlevel'
vim.o.fdm = "indent" -- 'foldmethod'
vim.o.fdn = 10 -- 'foldnestmax'
vim.o.fdt = "" -- 'foldtext'

-- Edit
vim.o.ai = true -- 'autoindent'
vim.o.et = true -- 'expandtab'
vim.o.fo = "rqnl1j" -- 'formatoptions'
vim.o.ic = true -- 'ignorecase'
vim.o.is = true --'incsearch'
vim.o.inf = true -- 'infercase'
vim.o.sw = 2 -- 'shiftwidth'
vim.o.scs = true -- 'smartcase'
vim.o.si = true -- 'smartindent'
vim.o.spo = "camel" -- 'spelloptions'
vim.o.ts = 2 -- 'tabstop'
vim.o.ve = "block" -- 'virtualedit'

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
vim.o.completeopt = "menu,menuone,noinsert,noselect"
