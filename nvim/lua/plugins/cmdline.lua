return {
  "VonHeikemen/fine-cmdline.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function ()
		require("fine-cmdline").setup {
			cmdline = {
				prompt = "  : "
			},
			popup = {
				position = {
					row = "38.2%",
					col = "50%",
				},
				size = 60,
				border = {
					text = {
						top = " Command ",
						top_align = "center",
					},
				},
				win_options = {
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				}
			}
		}
	end
}
