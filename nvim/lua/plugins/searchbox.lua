return {
  "VonHeikemen/searchbox.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		defaults = {
			prompt = " 󱩾 : ",
			clear_matches = false,
		},
		popup = {
			position = {
				row = "38.2%",
				col = "50%",
			},
			size = 60,
			border = {
				text = {
					top = " Search ",
					top_align = "center",
				},
			},
			win_options = {
				winhighlight = "Normal:Normal,FloatBorder:Normal",
			}
		}
	}
}
