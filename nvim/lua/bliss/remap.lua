vim.g.mapleader = " "
vim.keymap.set('n', '<leader>b', "<cmd>NvimTreeToggle<cr>", {noremap = true})
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {noremap = true})
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set('n', '<leader>w', "<cmd>w %<cr>", {noremap = true})

vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {noremap = true})
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {noremap = true})
