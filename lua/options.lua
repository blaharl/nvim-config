require("nvchad.options")

-- add yours here!

local opt = vim.opt
local o = vim.o
local g = vim.g

o.relativenumber = true

vim.cmd([[
autocmd Filetype * set formatoptions-=cro
autocmd Filetype * setlocal formatoptions-=cro
]])

vim.opt.langmap =
	"ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz"
