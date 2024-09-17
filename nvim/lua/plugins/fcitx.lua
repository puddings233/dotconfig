return {
	"puddings233/fcitx5-switcher.nvim",
	event = { "InsertEnter", "InsertLeave" },
	keys = ".",
	config = function()
		require("fcitx5-switcher-custom").setup({
			enable_manual = true,
			key = ".",
			mod = "a"
		})
	end
}
