return {
	"OXY2DEV/markview.nvim",
	config = function ()
		require("markview").setup({
			preview = {
				icon_provider = "devicons"
			}
		})
	end
}
