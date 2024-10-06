return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function ()
		require("gruvbox").setup({
			terminal_colors = true,
			contrast = "soft",
		})
		vim.opt.background = "dark"
		vim.cmd("colorscheme gruvbox")
	end
}
