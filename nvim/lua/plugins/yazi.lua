return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
  {
      "<C-f>",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
		}
	},
	opts = {
		keymaps = {
			open_file_in_tab = "k",
		}
	}
}
