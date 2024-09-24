return {
	"dstein64/nvim-scrollview",
	config = function ()
		require('scrollview').setup({
			mode = "auto",
			diagnostics_severities = { vim.diagnostic.severity.ERROR }
		})
	end
}
