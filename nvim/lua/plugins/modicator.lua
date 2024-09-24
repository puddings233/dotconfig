return {
	"mawkler/modicator.nvim",
	dependencies = "ellisonleao/gruvbox.nvim",
	init = function ()
		vim.opt.cursorline = true
		vim.opt.number = true
		vim.opt.termguicolors = true
	end,
	config = function ()
		require("modicator").setup({
			highlights = {
				defaults = {
					bold = true,
				}
			},
			integration = {
				lualine = {
					enabled = true,
					mode_section = nil,
					highlight = "fg",
				},
			}
		})
	end
}
