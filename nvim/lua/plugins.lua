local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
	{require("plugins.custom"),
	require("plugins.gruvbox"),
	require("plugins.lualine"),
	require("plugins.scroll"),
	require("plugins.modicator"),
	require("plugins.fcitx"),
	require("plugins.coq_nvim"),
	require("plugins.blankline"),
	require("plugins.nvim_lspconfig"),
	require("plugins.lsp_notify"),
	require("plugins.treesitter"),
	require("plugins.outline_nvim"),
	require("plugins.joshuto"),
	require("plugins.bufferline"),
	require("plugins.markdown")},
})

