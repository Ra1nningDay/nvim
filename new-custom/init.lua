require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.keymap.set("n", "<space>sp", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>bp", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>bn", ":bnext<CR>", { noremap = true, silent = true })
