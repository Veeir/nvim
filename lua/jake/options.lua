local options = {
	autoindent = true,
	smartindent = true,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	showtabline = 0,

	number = true,
	relativenumber = true,
	numberwidth = 4,
    syntax = "enable",

    termguicolors = true,

}

for option, value in pairs(options) do vim.opt[option] = value end
