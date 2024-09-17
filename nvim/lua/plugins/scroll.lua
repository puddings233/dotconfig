return {
	"dstein64/nvim-scrollview",
	lazy = false,
	config = function ()

		require('scrollview').setup({
			mode = "auto",
			diagnostics_severities = { vim.diagnostic.severity.ERROR }
		})

	end

}
