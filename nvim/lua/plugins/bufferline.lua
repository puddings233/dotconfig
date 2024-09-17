return {
	"akinsho/bufferline.nvim",
	lazy = false,
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function ()

		vim.opt.termguicolors = true

		require("bufferline").setup{
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			}
		}

	end

}
