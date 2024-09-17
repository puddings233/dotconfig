return{
	{
		dir = "~/.config/nvim/lua/custom/close",
		keys = {
			{ 'Q', ':lua quit_or_delete_buffer()<CR>', noremap = true },
		}
	},

	{
		dir = "~/.config/nvim/lua/custom/docker_filetype",
		ft = "yaml"
	}
}
