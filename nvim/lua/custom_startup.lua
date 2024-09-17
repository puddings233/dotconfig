-- some custom function that must be loaded at start up.

-- disable shada, from "https://shaobin-jiang.github.io/blog/posts/neovim-shada/"
vim.opt.shadafile = "NONE"
vim.api.nvim_create_autocmd("CmdlineEnter", {
	once = true,
	callback = function()
		local shada = vim.fn.stdpath("state") .. "/shada/main.shada"
		vim.o.shadafile = shada
		vim.api.nvim_command("rshada! " .. shada)
	end,
})
