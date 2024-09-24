-- this is for close tab and neovim via "Q"
function quit_or_delete_buffer()
	local function quit()
		if vim.fn.tabpagenr('$') == 1 then
			vim.cmd("q")  -- close neovim
		else
			vim.cmd("bdelete") -- close current tab via delete buffer
		end
	end

	if vim.fn.mode() ~= "i" then
		quit()
	end
end

-- this is for change file type when edit a file called "docker-compose.yml"
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "docker-compose.yml", "docker-compose.yaml" },
	callback = function ()
		vim.opt.filetype = "yaml.docker-compose"
	end
})
