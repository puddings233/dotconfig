vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.mouse = v
vim.opt.number = true
vim.opt.smartcase = true
vim.opt.tagcase = "followscs"
vim.opt.ttyfast = true

vim.opt.clipboard:append('unnamedplus')

if vim.g.neovide then
	vim.o.guifont = "Rec Mono Custom:h15"
	vim.g.neovide_fullscreen = false
	vim.g.neovide_remember_window_size = false
end
