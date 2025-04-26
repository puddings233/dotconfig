return {
	"mawkler/modicator.nvim",
	dependencies = "ellisonleao/gruvbox.nvim",
	init = function ()
		vim.opt.cursorline = true
		vim.opt.number = true
		vim.opt.termguicolors = true
	end,
	opts = {
		highlights = {
			defaults = {
				bold = true,
			}
		},
		ntegration = {
			lualine = {
			enabled = true,
			mode_section = nil,
			highlight = "fg",
			}
		}
	}
}
