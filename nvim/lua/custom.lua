-- this is for close tab and neovim via "Q"
function quit_or_delete_buffer()
	if vim.fn.mode() ~= "i" then
		vim.cmd(vim.fn.tabpagenr("$") == 1 and "q" or "bdelete")
	end
end

-- this is for change file type when edit a file called "docker-compose.yml"
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "docker-compose.yml", "docker-compose.yaml" },
	callback = function ()
		vim.opt.filetype = "yaml.docker-compose"
	end
})
