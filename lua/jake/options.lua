local options = {
	autoindent = true,
	smartindent = true,
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	showtabline = 0,

	number = true,
	relativenumber = true,
	numberwidth = 4,

  background = "dark",

}

for option, value in pairs(options) do vim.opt[option] = value end
