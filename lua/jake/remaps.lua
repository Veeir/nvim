local Remap = require("jake.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap

local silent = { silent = true }

-- Shmovement
nnoremap("<C-L>", "<C-W><C-L>")
nnoremap("<C-H>", "<C-W><C-H>")
nnoremap("<C-K>", "<C-W><C-K>")
nnoremap("<C-J>", "<C-W><C-J>")

-- Global Yank
xnoremap("<leader>y", '"*Y')

-- built in terminal
nnoremap("<leader>t", "<Cmd>sp<CR> <Cmd>term<CR> <Cmd>resize 20N<CR> i", silent)
tnoremap("<C-c><C-c>", "<C-\\><C-n>", silent)
tnoremap("<D-v>", function()
  local keys = vim.api.nvim_replace_termcodes("<C-\\><C-n>\"+pi", true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end, silent)

-- Plugins
nnoremap("<leader>q", ":Neotree toggle=true<CR>", silent)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
