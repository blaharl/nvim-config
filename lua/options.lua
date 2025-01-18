require("nvchad.options")

-- add yours here!

local opt = vim.opt
local o = vim.o
local g = vim.g

o.relativenumber = true

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
