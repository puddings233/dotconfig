return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config=function ()
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}
		local hooks = require "ibl.hooks"
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FB4934" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FABD2F" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#83A598" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FE8019" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98971A" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#D3869B" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#689D6A" })
		end)
		require("ibl").setup { indent = { highlight = highlight }}
	end
}
