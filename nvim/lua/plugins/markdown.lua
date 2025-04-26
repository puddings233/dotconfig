return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	--need package "yarn" instealled.
	build = "cd app && yarn install",
	ft = { "markdown" },
	-- autostart option must be included in the init function
	init = function ()
    vim.g.mkdp_filetypes = { "markdown" }
		vim.g.mkdp_auto_start = 1
	end,
	-- other options, edit the new_ptions variable
	config = function ()
		vim.g.mkdp_theme = "light"
		vim.g.mkdp_page_title = "${name}.md"
		vim.g.mkdp_preview_options = { sync_scroll_type = "relative" }
	end,
}
