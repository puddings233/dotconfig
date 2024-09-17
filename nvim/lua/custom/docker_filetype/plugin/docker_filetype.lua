-- this is for change file type when edit a file called "docker-compose.yml"
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "docker-compose.yml", "docker-compose.yaml" },
	callback = function ()
		vim.opt.filetype = "yaml.docker-compose"
	end
})
