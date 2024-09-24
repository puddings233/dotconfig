return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function ()
		require("gruvbox").setup({
			contrast = "soft",
		})
		vim.opt.background = "dark"
		vim.cmd("colorscheme gruvbox")
	end
}
