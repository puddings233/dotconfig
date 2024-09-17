return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = function () vim.fn["mkdp#util#install"]() end,
	ft = { "markdown" },

	-- autostart option must be included in the init function
	init = function ()
		vim.g.mkdp_auto_start = 1
	end,

	-- other options, edit the new_ptions variable
	config = function ()
		local new_options_markdown = {
			{ change = "mkdp_theme", to = "light" },
		}

		for _,opt in ipairs(new_options_markdown) do
			vim.g[opt.change] = opt.to
		end

		-- special option
		vim.g.mkdp_preview_options = { sync_scroll_type = "relative" }

	end,

}
