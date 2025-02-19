return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
  {
      "<C-f>",
      "<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		}
	},
	opts = {
		keymaps = {
			open_file_in_tab = "k",
		}
	}
}
