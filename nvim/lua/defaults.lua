local op = vim.opt

op.confirm = true
op.cursorline = true
op.cursorlineopt = "line"
op.ignorecase = true
op.tabstop = 2
op.softtabstop = 2
op.shiftwidth = 2
op.autoindent = true
op.smarttab = true
op.mouse = "v"
op.relativenumber = true
op.smartcase = true
op.tagcase = "followscs"
op.ttyfast = true
op.wrap = false
op.signcolumn = "yes:1"

op.clipboard:append('unnamedplus')

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
		},
	},
	virtual_text = true,
	virtual_lines = false,
})
