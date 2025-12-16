local add, now, later, now_if_args = MiniDeps.add, MiniDeps.now, MiniDeps.later, _G.Config.now_if_args

vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch)

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
  desc = "Exit terminal mode",
})

_G.Config.leader_group_clues = {
  { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
  { mode = "n", keys = "<Leader>d", desc = "+Debug" },
  { mode = "n", keys = "<Leader>e", desc = "+Explore/Edit" },
  { mode = "n", keys = "<Leader>f", desc = "+Fuzzy Find" },
  { mode = "n", keys = "<Leader>g", desc = "+Git" },
  { mode = "n", keys = "<Leader>l", desc = "+LSP/Treesitter" },
  { mode = "n", keys = "<Leader>q", desc = "+Quit" },
  { mode = "n", keys = "<Leader>s", desc = "+Session" },
  { mode = "n", keys = "<Leader>t", desc = "+Terminal" },
  --
  { mode = "x", keys = "<Leader>g", desc = "+Git" },
  { mode = "x", keys = "<Leader>l", desc = "+LSP" },
}

-- +Explore/Edit
local explore_at_file = "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>"
local explore_quickfix = function()
  for _, win_id in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.fn.getwininfo(win_id)[1].quickfix == 1 then
      return vim.cmd("cclose")
    end
  end
  vim.cmd("copen")
end

vim.keymap.set("n", "<leader>ed", "<CMD>lua MiniFiles.open()<CR>", { desc = "Currrent Working Directory" })
vim.keymap.set("n", "<leader>ef", explore_at_file, { desc = "File directory" })
vim.keymap.set("n", "<leader>eq", explore_quickfix, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>en", "<Cmd>lua MiniNotify.show_history()<CR>", { desc = "Notifications" })

-- +Git
local git_log_cmd = [[Git log --pretty=format:\%h\ \%as\ │\ \%s --topo-order]]
local git_log_buf_cmd = git_log_cmd .. " --follow -- %"

vim.keymap.set("n", "<leader>gg", "<Cmd>lua Snacks.lazygit.open()<CR>", { desc = "LazyGit" })
vim.keymap.set("n", "<leader>ga", "<Cmd>Git diff --cached<CR>", { desc = "Added diff" })
vim.keymap.set("n", "<leader>gA", "<Cmd>Git diff --cached -- %<CR>", { desc = "Added diff buffer" })
vim.keymap.set("n", "<leader>gc", "<Cmd>Git commit<CR>", { desc = "Commit" })
vim.keymap.set("n", "<leader>gC", "<Cmd>Git commit --amend<CR>", { desc = "Commit amend" })
vim.keymap.set("n", "<leader>gd", "<Cmd>Git diff<CR>", { desc = "Diff" })
vim.keymap.set("n", "<leader>gD", "<Cmd>Git diff -- %<CR>", { desc = "Diff buffer" })
vim.keymap.set("n", "<leader>gl", "<Cmd>" .. git_log_cmd .. "<CR>", { desc = "Log" })
vim.keymap.set("n", "<leader>gL", "<Cmd>" .. git_log_buf_cmd .. "<CR>", { desc = "Log buffer" })
vim.keymap.set("n", "<leader>go", "<Cmd>lua MiniDiff.toggle_overlay()<CR>", { desc = "Toggle overlay" })
vim.keymap.set("n", "<leader>gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", { desc = "Show at cursor" })

-- +

later(function()
  local miniclue = require("mini.clue")
  miniclue.setup({
    clues = {
      Config.leader_group_clues,
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),
    },
    triggers = {
      -- Leader triggers
      { mode = "n", keys = "<Leader>" },
      { mode = "x", keys = "<Leader>" },
      -- Built-in completion
      { mode = "i", keys = "<C-x>" },
      -- `g` key
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },
      -- Marks
      { mode = "n", keys = "'" },
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },
      -- Registers
      { mode = "n", keys = '"' },
      { mode = "x", keys = '"' },
      { mode = "i", keys = "<C-r>" },
      { mode = "c", keys = "<C-r>" },
      -- Window commands
      { mode = "n", keys = "<C-w>" },
      -- `z` key
      { mode = "n", keys = "z" },
      { mode = "x", keys = "z" },
      -- `s` key
      { mode = "n", keys = "s" },
      { mode = "x", keys = "s" },
      -- mini.bracketed
      { mode = "n", keys = "[" },
      { mode = "n", keys = "]" },
      { mode = "x", keys = "[" },
      { mode = "x", keys = "]" },
    },
  })
end)
